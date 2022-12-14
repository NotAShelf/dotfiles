{
  pkgs,
  lib,
  config,
  ...
}: {
  systemd.services.gitea.serviceConfig.SystemCallFilter =
    lib.mkForce
    "~@clock @cpu-emulation @debug @keyring @memlock @module @obsolete @raw-io @reboot @resources @setuid @swap";

  services = {
    gitea = {
      enable = false;
      lfs.enable = true;

      user = "git";
      database.user = "git";

      appName = "The Secret Shelf";
      domain = "git.notashelf.dev";
      rootUrl = "https://git.notashelf.dev";
      httpPort = 7000;
      settings = {
        repository.PREFERRED_LICENSES = "MIT,GPL-3.0,GPL-2.0,LGPL-3.0,LGPL-2.1";
        server = {
          START_SSH_SERVER = false;
          BUILTIN_SSH_SERVER_USER = "git";
          SSH_PORT = 22;
          DISABLE_ROUTER_LOG = true;
          SSH_CREATE_AUTHORIZED_KEYS_FILE = true;
        };
        attachment.ALLOWED_TYPES = "*/*";
        service.DISABLE_REGISTRATION = true;
        ui.DEFAULT_THEME = "arc-green";
      };
    };
  };
}
