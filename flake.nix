{
  description = "My NixOS configuration with questionable stability";
  # https://github.com/notashelf/dotfiles

  outputs = {
    self,
    nixpkgs,
    nixos-generators,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import inputs.nixpkgs {
      inherit system;
      config = {
        tarball-ttl = 0;
      };
    };
  in {
    nixosConfigurations = import ./hosts inputs;

    # SD Card image for Raspberry Pi 4
    # build with `nix build .#images.atlas`
    images = {
      # TODO: import images from a different file to de-clutter flake.nix
      atlas =
        (self.nixosConfigurations.atlas.extendModules {
          modules = ["${inputs.nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"];
        })
        .config
        .system
        .build
        .sdImage;

      atlas2 =
        (self.nixosConfigurations.atlas.extendModules {
          modules = ["${inputs.nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"];
        })
        .config
        .system
        .build
        .sdImage;
    };

    packages.${system} = {
      # Catpuccin
      catppuccin-folders = pkgs.callPackage ./pkgs/catppuccin-folders.nix {};
      catppuccin-gtk = pkgs.callPackage ./pkgs/catppuccin-gtk.nix {};
      catppuccin-cursors = pkgs.callPackage ./pkgs/catppuccin-cursors.nix {};

      # Custom rofi plugins
      rofi-calc-wayland = pkgs.callPackage ./pkgs/rofi-calc-wayland.nix {};
      rofi-emoji-wayland = pkgs.callPackage ./pkgs/rofi-emoji-wayland.nix {};

      # My personal derivations for packages that are not on nixpkgs
      nicksfetch = pkgs.callPackage ./pkgs/nicksfetch.nix {};
      cloneit = pkgs.callPackage ./pkgs/cloneit.nix {};
      swww = pkgs.callPackage ./pkgs/swww.nix {};

      # ISO builds
      # TODO: import ISO builds from a different file to de-clutter flake.nix
      iso-server-generic = nixos-generators.nixosGenerate {
        system = "${system}";
        format = "iso";
        modules = [];
      };

      iso-desktop-generic = nixos-generators.nixosGenerate {
        system = "${system}";
        format = "iso";
        modules = [];
      };
    };

    devShells.${system}.default = pkgs.mkShell {
      name = "nixos";
      packages = with pkgs; [
        rnix-lsp
        yaml-language-server
        alejandra
        git
        glow
      ];
    };

    formatter.${system} = pkgs.alejandra;
  };
  inputs = {
    # Nix itself, the package manager
    nix = {
      url = "github:NixOS/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nixpkgs variants for different channels
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-22.11";
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";

    # Fortunateteller2k's nixpkgs collection
    nixpkgs-f2k = {
      url = "github:fortuneteller2k/nixpkgs-f2k";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Automated, pre-built packages for Wayland
    nixpkgs-wayland = {
      url = "github:nix-community/nixpkgs-wayland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix User Repository
    nur.url = "github:nix-community/NUR";

    # Nix Developer Environments
    devshell.url = "github:numtide/devshell";

    # Repo for hardare-specific NixOS modules
    nixos-hardware.url = "github:nixos/nixos-hardware";

    # Generate bootable ISOs for my declarative systems
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Secrets management via ragenix, an agenix replacement
    ragenix.url = "github:yaxitech/ragenix";

    # Hyprland & Hyprland Contrib repos
    hyprland.url = "github:hyprwm/Hyprland/";
    hyprpicker.url = "github:hyprwm/hyprpicker";
    xdg-portal-hyprland.url = "github:hyprwm/xdg-desktop-portal-hyprland";
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Emacs & Doom Emacs
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    nix-doom-emacs = {
      url = "github:nix-community/nix-doom-emacs";
      inputs.nixpkgs.follows = "emacs-overlay";
    };

    # Rust overlay
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Webcord, maybe works better than discord client?
    webcord.url = "github:fufexan/webcord-flake";

    # Spicetify
    spicetify-nix.url = "github:the-argus/spicetify-nix";

    helix.url = "github:SoraTenshi/helix/experimental";

    # Nix Language server
    nil = {
      url = "github:oxalica/nil";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.rust-overlay.follows = "rust-overlay";
    };
  };
}
