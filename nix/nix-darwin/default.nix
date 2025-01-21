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

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
    };
    casks = [
      "appcleaner"
      "brave-browser"
      "deepl"
      "discord"
      "figma"
      "firefox"
      "google-chrome"
      "intellij-idea"
      "keycastr"
      "notion"
      "obs"
      "obsidian"
      "orbstack"
      "postman"
      "raycast"
      "rectangle"
      "slack"
      "visual-studio-code"
      "warp"
      "wezterm"
      "wireshark"
      "zed"
      "zed"
      "zoom"
    ];
  };
}
