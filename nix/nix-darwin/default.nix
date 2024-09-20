{pkgs, ...}: {
  nix = {
    gc = {
      automatic = true;
      interval = {
        Hour = 9;
        Minute = 0;
      };
      options = "--delete-older-than 7d";
    };
    optimise.automatic = true;
    settings = {
      experimental-features = "nix-command flakes";
      max-jobs = 8;
    };
  };

  services.nix-daemon.enable = true;

  system = {
    defaults = {
      NSGlobalDomain.AppleShowAllExtensions = true;
      finder = {
        AppleShowAllFiles = true;
        AppleShowAllExtensions = true;
      };
      dock = {
        autohide = true;
        show-recents = false;
        orientation = "bottom";
      };
    };

    stateVersion = 5;
  };
}
