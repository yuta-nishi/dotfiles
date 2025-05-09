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
      cargo-nextest
      delta
      eza
      fastfetch
      fd
      ffmpeg
      fzf
      gcc
      gh
      ghq
      git
      glances
      go-task
      golangci-lint
      gotools
      hadolint
      htop
      hugo
      imagemagick
      jq
      jqp
      just
      lazydocker
      lazygit
      lazysql
      lefthook
      micromamba
      mise
      nowplaying-cli
      onefetch
      perl
      poppler
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
      typst
      typstyle
      uv
      vim
      wget
      yazi
      zoxide
      zsh
    ];
  };

  programs.home-manager.enable = true;
}
