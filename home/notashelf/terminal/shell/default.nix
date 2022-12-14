{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./git.nix
    ./starship.nix
    ./zsh.nix
    ./nix-shell.nix
    ./transient-services.nix
  ];

  programs = {
    exa.enable = true;

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    dircolors = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  home = {
    sessionPath = [
      "${config.home.homeDirectory}/.local/bin"
    ];

    file = {
      ".local/bin/updoot" = {
        # Upload and get link
        executable = true;
        text = import ./bin/updoot.nix {inherit lib pkgs;};
      };

      ".local/bin/preview.sh" = {
        # Preview script for fzf tab
        executable = true;
        text = import ./bin/preview.nix {inherit lib pkgs;};
      };

      ".local/bin/show-zombie-parents.nix" = {
        executable = true;
        text = import ./bin/show-zombie-parents.nix {inherit lib pkgs;};
      };
    };
  };
}
