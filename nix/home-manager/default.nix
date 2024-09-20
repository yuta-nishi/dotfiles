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
      delta
      eza
      fd
      ffmpeg
      fzf
      gcc
      ghq
      git
      glances
      hadolint
      htop
      hugo
      jq
      lefthook
      lua
      micromamba
      mise
      neovim
      perl
      rbenv
      ripgrep
      sheldon
      shellcheck
      shfmt
      starship
      tmux
      tokei
      tree
      uv
      vim
      wget
      zoxide
      zsh
    ];
  };

  programs.home-manager.enable = true;
}
