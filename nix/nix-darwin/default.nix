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

  system = {
    primaryUser = "yutanishi";
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
      "balenaetcher"
      "brave-browser"
      "chatgpt"
      "claude"
      "dbeaver-community"
      "deepl"
      "discord"
      "figma"
      "firefox"
      "font-sf-mono"
      "font-sf-pro"
      "google-chrome"
      "intellij-idea"
      "keycastr"
      "mactex-no-gui"
      "notion"
      "obs"
      "obsidian"
      "orbstack"
      "postman"
      "raycast"
      "sf-symbols"
      "slack"
      "spotify"
      "visual-studio-code"
      "warp"
      "wezterm"
      "wireshark"
      "zed"
      "zoom"
    ];
  };
}
