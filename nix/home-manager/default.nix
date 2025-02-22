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
      fastfetch
      fd
      ffmpeg
      fzf
      gcc
      ghq
      git
      glances
      go-task
      golangci-lint
      gotools
      hadolint
      htop
      hugo
      jq
      lazydocker
      lazygit
      lazysql
      lefthook
      micromamba
      mise
      nowplaying-cli
      perl
      rbenv
      ripgrep
      sheldon
      shellcheck
      shfmt
      starship
      switchaudio-osx
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
