-- lldb-dap attach setup for bare-metal `x86_64-unknown-uefi` images.
--
-- QEMU is started separately with `-s -S`, and the `.efi` is a PE image that
-- OVMF loads at a base chosen at runtime. LLDB only knows the ImageBase from the
-- PE header, so it needs the runtime slide before the DWARF symbols line up
-- with what is in memory.
--
-- OVMF picks that base per boot, so it has to come from the `image: base=...`
-- line of the run being debugged; a rebuild or a different boot can change it.
-- Environment overrides: $UEFI_IMAGE_BASE, $UEFI_GDB_PORT, $UEFI_EFI.
local M = {}

local PREFERRED_BASE_FALLBACK = "0x140000000" -- default /BASE for PE32+ images
local CACHE = vim.fs.joinpath(vim.fn.stdpath("cache"), "uefi-dap.json")

---Split a hex u64 into 32-bit halves so the value stays exact (Lua numbers are doubles).
---@param hex string
---@return number hi, number lo
local function split_u64(hex)
  hex = tostring(hex):gsub("%s+", ""):gsub("^0[xX]", "")
  assert(hex:match("^%x+$"), "not a hex address: " .. hex)
  assert(#hex <= 16, "address wider than 64 bits: " .. hex)
  local lo = tonumber(hex:sub(-8), 16) or 0
  local hi = #hex > 8 and tonumber(hex:sub(1, #hex - 8), 16) or 0
  return hi, lo
end

---`base - preferred` modulo 2^64, the form `target modules load --slide` expects.
---@param base string runtime image base
---@param preferred string image base recorded in the .efi
---@return string
local function slide(base, preferred)
  local bh, bl = split_u64(base)
  local ph, pl = split_u64(preferred)
  local lo = bl - pl
  local borrow = 0
  if lo < 0 then
    lo, borrow = lo + 0x100000000, 1
  end
  return string.format("0x%08x%08x", (bh - ph - borrow) % 0x100000000, lo)
end

---ImageBase recorded in the PE32/PE32+ header of `path`.
---@param path string
---@return string|nil
local function pe_image_base(path)
  local f = io.open(path, "rb")
  if not f then
    return nil
  end
  local function read(offset, len)
    f:seek("set", offset)
    local bytes = f:read(len)
    return bytes and #bytes == len and bytes or nil
  end
  local function u16(offset)
    local bytes = read(offset, 2)
    return bytes and (bytes:byte(1) + bytes:byte(2) * 0x100) or nil
  end
  local function u32(offset)
    local bytes = read(offset, 4)
    if not bytes then
      return nil
    end
    local value = 0
    for i = 4, 1, -1 do
      value = value * 0x100 + bytes:byte(i)
    end
    return value
  end

  local pe = u32(0x3c) -- e_lfanew
  local magic = pe and u16(pe + 0x18) -- OptionalHeader.Magic
  local lo, hi
  if magic == 0x20b then -- PE32+
    lo, hi = u32(pe + 0x30), u32(pe + 0x34)
  elseif magic == 0x10b then -- PE32
    lo, hi = u32(pe + 0x34), 0
  end
  f:close()
  if not lo or not hi then
    return nil
  end
  return string.format("0x%08x%08x", hi, lo)
end

---The .efi built for the current cargo project.
---@return string|nil
local function find_efi()
  local preset = vim.env.UEFI_EFI
  if preset and preset ~= "" then
    return vim.fs.normalize(vim.fn.expand(preset))
  end
  local dir = vim.fs.joinpath(vim.fn.getcwd(), "target/x86_64-unknown-uefi/debug")
  local found = vim.fn.glob(dir .. "/*.efi", false, true)
  if #found == 1 then
    return vim.fs.normalize(found[1])
  end
end

---Runtime image base for `efi`, asked once per boot because OVMF chooses it.
---@param efi string
---@return string|nil
local function image_base(efi)
  if vim.env.UEFI_IMAGE_BASE and vim.env.UEFI_IMAGE_BASE ~= "" then
    return vim.env.UEFI_IMAGE_BASE
  end

  local stat = vim.uv.fs_stat(efi)
  local stamp = stat and string.format("%d:%d", stat.size, stat.mtime.sec) or ""
  local cached = {}
  local f = io.open(CACHE, "r")
  if f then
    local ok, data = pcall(vim.json.decode, f:read("*a"))
    f:close()
    if ok and type(data) == "table" then
      cached = data
    end
  end
  -- The base is only stable for one build *and* one boot, so reuse it as a
  -- convenience default, never as an authoritative value.
  local default = (cached.efi == efi and cached.stamp == stamp) and cached.base or ""

  local base = vim.trim(vim.fn.input({
    prompt = "UEFI image base from this boot (`image: base=0x...`): ",
    default = default,
  }) or "")
  if base == "" then
    return nil
  end
  if not pcall(split_u64, base) then
    vim.notify("UEFI: not a hex address: " .. base, vim.log.levels.ERROR)
    return nil
  end

  f = io.open(CACHE, "w")
  if f then
    f:write(vim.json.encode({ efi = efi, stamp = stamp, base = base }))
    f:close()
  end
  return base
end

---@return string
local function lldb_dap()
  local found = vim.fn.exepath("lldb-dap")
  if found ~= "" then
    return found
  end
  for _, candidate in ipairs({
    "/Applications/Xcode.app/Contents/Developer/usr/bin/lldb-dap",
    "/Library/Developer/CommandLineTools/usr/bin/lldb-dap",
  }) do
    if vim.fn.executable(candidate) == 1 then
      return candidate
    end
  end
  return "lldb-dap"
end

local configured = false

---Register the adapter and, when the current project builds a UEFI image, the
---picker entry. nvim-dap is also configured by LazyVim, so this must not
---override its `config` function.
---@return table dap
local function setup()
  local dap = require("dap")
  if configured then
    return dap
  end
  configured = true
  dap.adapters.lldb = {
    type = "executable",
    command = lldb_dap(),
    name = "lldb-dap",
  }
  dap.configurations.rust = dap.configurations.rust or {}
  if find_efi() then
    table.insert(dap.configurations.rust, 1, M.config())
  end
  return dap
end

---Attach to a QEMU instance already listening on a gdb stub.
function M.attach()
  if not find_efi() then
    vim.notify(
      "UEFI: no .efi under target/x86_64-unknown-uefi/debug (set $UEFI_EFI)",
      vim.log.levels.WARN
    )
    return
  end
  setup().run(M.config())
end

---Attach configuration for a QEMU instance already listening on a gdb stub.
---@return table
function M.config()
  return {
    type = "lldb",
    request = "attach",
    name = "UEFI: attach to QEMU (gdb stub)",
    program = function()
      local efi = find_efi()
      if not efi then
        vim.notify(
          "UEFI: no .efi under target/x86_64-unknown-uefi/debug (set $UEFI_EFI)",
          vim.log.levels.ERROR
        )
        return require("dap").ABORT
      end
      return efi
    end,
    attachCommands = function()
      local efi = find_efi()
      local base = efi and image_base(efi)
      if not efi or not base then
        return {}
      end
      local port = vim.env.UEFI_GDB_PORT
      if not port or port == "" then
        port = "1234"
      end
      return {
        "gdb-remote " .. port,
        string.format(
          'target modules load --file "%s" --slide %s',
          efi,
          slide(base, pe_image_base(efi) or PREFERRED_BASE_FALLBACK)
        ),
      }
    end,
  }
end

return {
  {
    "mfussenegger/nvim-dap",
    init = function()
      LazyVim.on_load("nvim-dap", setup)
    end,
    keys = {
      {
        "<leader>dU",
        function()
          M.attach()
        end,
        desc = "UEFI: attach QEMU",
      },
    },
  },
}
