{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: let
  username = "yutanishi";
in {
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
      alejandra
      ansible
      atuin
      bat
      bun
      curl
      deno
      delta
      eza
      fd
      ffmpeg
      fzf
      gcc
      ghq
      git
      glances
      go
      hadolint
      htop
      hugo
      jdk22
      jq
      lefthook
      lua
      mise
      neovim
      perl
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
      micromamba
      uv
      vim
      wget
      zoxide
      zsh
    ];
  };

  programs.home-manager.enable = true;
}
