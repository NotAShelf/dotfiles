final: prev: {
  nixos-plymouth = prev.callPackage ./plymouth {};
  fastfetch = prev.callPackage ./fastfetch {};

  catppuccin-gtk = prev.callPackage ../catppuccin-gtk.nix {};
  catppuccin-folders = prev.callPackage ../catppuccin-folders.nix {};
  catppuccin-cursors = prev.callPackage ../catppuccin-cursors.nix {};

  cloneit = prev.callPackage ../cloneit.nix {};
  proton-ge = prev.callPackage ../proton-ge.nix {};
  anime4k = prev.callPackage ../anime4k.nix {};
}