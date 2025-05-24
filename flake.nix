{
  description = "My package definition";

  inputs = {
    nixpkgs.url = "github:Nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-darwin,
    ...
  } @ inputs: let
    system = "aarch64-darwin";
    username = "yutanishi";
    pkgs = import nixpkgs {inherit system;};
  in {
    apps.${system} = {
      update = {
        type = "app";
        program = toString (
          pkgs.writeShellScript "update-script" ''
            set -e
            echo "Updating flake..."
            nix flake update
            echo "Updating home-manager..."
            home-manager switch --flake .#myHomeConfig
            echo "Updating nix-darwin..."
            sudo nix run nix-darwin -- switch --flake .#myDarwinConfig
            echo "Update complete!"
          ''
        );
      };

      update-home = {
        type = "app";
        program = toString (
          pkgs.writeShellScript "update-home-script" ''
            set -e
            echo "Updating flake..."
            nix flake update
            echo "Updating home-manager..."
            home-manager switch --flake .#myHomeConfig
            echo "Home-manager update complete!"
          ''
        );
      };

      update-darwin = {
        type = "app";
        program = toString (
          pkgs.writeShellScript "update-darwin-script" ''
            set -e
            echo "Updating flake..."
            nix flake update
            echo "Updating nix-darwin..."
            sudo nix run nix-darwin -- switch --flake .#myDarwinConfig
            echo "Nix-darwin update complete!"
          ''
        );
      };
    };

    homeConfigurations = {
      myHomeConfig = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        extraSpecialArgs = {
          inherit inputs;
        };
        modules = [./nix/home-manager];
      };
    };

    darwinConfigurations = {
      myDarwinConfig = nix-darwin.lib.darwinSystem {
        system = system;
        modules = [./nix/nix-darwin];
      };
    };
  };
}
