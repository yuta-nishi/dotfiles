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
    # https://github.com/NixOS/nixpkgs/issues/400373#issuecomment-2848616226
    overlays = [
      (final: prev: rec {
        python312 = prev.python312.override {
          packageOverrides = final: prev: {
            mocket = prev.mocket.overridePythonAttrs (oldAttrs: rec {
              disabledTests =
                oldAttrs.disabledTests
                ++ [
                  "test_httprettish_httpx_session"
                ];
            });
          };
        };
        python312Packages = python312.pkgs;
      })
    ];
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
