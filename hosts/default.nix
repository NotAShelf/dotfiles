{
  nixpkgs,
  self,
  ...
}: let
  inputs = self.inputs;

  # my modules
  core = ../modules/core;
  desktop = ../modules/desktop;
  server = ../modules/server;
  nvidia = ../modules/nvidia;
  wayland = ../modules/wayland;

  # individual bootloaders
  bl-common = ../modules/bootloaders/common.nix;
  bl-server = ../modules/bootloaders/server.nix;

  # flake inputs
  hmModule = inputs.home-manager.nixosModules.home-manager;
  hw = inputs.nixos-hardware.nixosModules;
  ragenix = inputs.ragenix.nixosModules.age;

  shared = [core ragenix];

  home-manager = {
    users.notashelf = ../modules/home;
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs;
      inherit self;
    };
  };
in {
  # HP Pavillion
  prometheus = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules =
      [
        {networking.hostName = "prometheus";}
        ./prometheus
        bl-common
        desktop
        nvidia
        wayland
        hmModule
        {inherit home-manager;}
      ]
      ++ shared;

    specialArgs = {inherit inputs;};
  };

  # Thinkpad Lenovo Yoga
  icarus = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules =
      [
        {networking.hostName = "icarus";}
        ./icarus
        bl-server
        server
        wayland
        hmModule
        {inherit home-manager;}
      ]
      ++ shared;
    specialArgs = {inherit inputs;};
  };

  # Raspberry Pi 400
  atlas = nixpkgs.lib.nixosSystem {
    system = "aarch64-linux";
    modules =
      [
        {networking.hostName = "atlas";}
        ./atlas
        hw.raspberry-pi-4
        server
      ]
      ++ shared;
    specialArgs = {inherit inputs;};
  };
}
