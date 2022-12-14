{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    # import system packages
    ./packages.nix

    # apps and services I use
    ./graphical
    ./terminal
    ./services
    ./gaming

    # declarative system and program theme
    ./themes
  ];
  config = {
    # reload system units when changing configs
    systemd.user.startServices = "sd-switch";

    home = {
      # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
      # I will personally strangle every moron who just puts "DONT CHANGE" next
      # to this value
      stateVersion = "23.05";
      extraOutputsToInstall = ["doc" "devdoc"];
    };

    modules = {
      programs = {
        # cozy neovim config with catppuccin colors
        cnvim.enable = true;

        # schizo firefox config based on firefox ESR
        schizofox = {
          enable = true;
          translate = {
            enable = true;
            sourceLang = "en";
            targetLang = "tr";
          };
        };
      };
    };
  };
}
