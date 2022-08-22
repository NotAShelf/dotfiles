{ inputs, pkgs, config, ... }:

{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    inputs.eww.packages."${system}".eww-wayland
    wf-recorder
    pfetch
    nordzy-icon-theme
    bottom
    wofi
    imv
    hyperfine
    waybar
    swappy
    gimp
    kdenlive
    swaybg
    slurp
    grim
    pngquant
    wl-clipboard
    proxychains-ng
    # cli tools
    exa
    ffmpeg
    unzip
    libnotify
    gnupg
    yt-dlp
    ripgrep
    rsync
    imagemagick
    unrar
    tealdeer
    killall
    du-dust
    bandwhich
    grex
    fd
    xh
    jq
    figlet
    lm_sensors
    # gui apps
    keepassxc
    # unfree apps (sorry daddy stallman)
    minecraft
    # dev tools
    python3
    git
    jdk
    dconf
    gcc
    rustc
    rustfmt
    cargo
  ];
}
