{ inputs
, lib
, config
, pkgs
, ...
}:
let
  username = "yutanishi";
in
{
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = username;
    homeDirectory = "/Users/${username}";
    stateVersion = "24.05"; # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    packages = with pkgs; [
      ansible
      atuin
      bat
      bun
      curl
      deno
      eza
      fd
      ffmpeg
      fzf
      gcc
      git
      go
      htop
      hugo
      jq
      lua
      mise
      neovim
      nixpkgs-fmt
      pnpm
      rbenv
      ripgrep
      sheldon
      shellcheck
      shfmt
      starship
      tmux
      tokei
      tree
      vim
      zsh
    ];
  };

  programs.home-manager.enable = true;
}
