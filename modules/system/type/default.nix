{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  device = config.modules.device;
in {
  config = mkMerge [
    (mkIf (device.type == "laptop") {
      imports = [
        ./laptop.nix
      ];
    })
  ];
}
