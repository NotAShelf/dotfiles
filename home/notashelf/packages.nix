{
  inputs,
  self,
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    # Graphical
    thunderbird
    tdesktop
    lutris
    dolphin-emu
    qbittorrent
    quasselClient
    bitwarden
    xfce.thunar
    obsidian
    nextcloud-client
    #gnome.gnome-control-center # FIXME: fails to build due dependency mismatch
    gnome.gnome-tweaks
    gnome.gnome-calendar
    pavucontrol
    ungoogled-chromium
    easyeffects
    librewolf

    # CLI
    cloneit
    catimg
    duf
    todo
    mpv
    yt-dlp
    hyperfine
    fzf
    file
    unzip
    ripgrep
    rsync
    imagemagick
    bandwhich
    grex
    fd
    xh
    jq
    figlet
    lm_sensors
    bitwarden-cli
    dconf
    gcc
    cmake
    trash-cli
    cached-nix-shell
    ttyper
    docker-compose
    docker-credential-helpers
    xorg.xhost
    mov-cli
    nitch
    fastfetch
    imv
    binwalk
    binutils
    diffoscope
  ];
}
