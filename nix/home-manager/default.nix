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
  };

  programs.home-manager.enable = true;
}
