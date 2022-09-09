<p align="center">
  <img width="25%" src="https://github.com/notashelf.png" />
</p>

<p align="center">
  <b>A repository for most things starting with a dot</b>
</p>




Hello stranger,

If you have randomly stumbled on repository, I am sorry to have subjected you to this... mess would be one way to put it. 

You may leave while you still have time.
If you, however, are here on purpose; most likely looking for a specific configuration. 
Then I pity you. Oh, to be looking for a specific configuration in the repository of my dotfiles.

Below, you will find a small repository map to somewhat help you out with whatever the hell I have going on in this repository. Best of luck, traveller.

*P.S. If you have *any* suggestions for better managing my dotfiles, please let me know. I am in pain.*


## Main Applications

- Compositor: [Hyprland](https://github.com/hyprwm/hyprland) - *The* Wayland compositor. 
- Notification Daemon: swaync
- Bar: Waybar
- Wallpaper Daemon: wpaperd
- Application Menu: Wofi
- Polkit Agent: xfce-polkit
- Gamma Controller: gammastep (only one that works on NVIDIA gpus)
- Locker: swaylock-effects (the mildly more updated fork)
- Clipboard Manager: Clipman 

You will find my configs for Hyprland, Swaync, Waybar, wpaperd and Wofi in the .config directory.










## Repository Map

```
├── Hyprland (My Hyprland launch script on NVIDIA. Mostly useless on AMD GPUs.)
├── Hyprdebug (Experimental script for launching Hyprland better suited for debugging. WIP.)
│
├── .config/
│   │
│   ├── MangoHud/
│   │   └──MangoHud.conf - Self explanatory, I hope.
│   │
│   ├── alacritty/
│   │    ├── alacritty.yml - Default alacritty config, mostly monochromatic.
│   │    ├── alacritty.yml.save - Old config, mostly the defaults.
│   │    └── alacritty.tar.gz - Backup of my Sway (or default, idk) era alacritty config.
|   |
│   ├── beets/
│   │   └── config.yaml - Used for mpd & nncmpp auto-tagging
│   |
|   ├── bspwm/
|   |   └── bspwwmrc - Once upon a time, I used this. Messy, stolen config.
│   │
│   ├── eww
│   │   ├── dashboard/
|   |   |    ├── images/ - Images for the dashboard.
|   |   |    ├── scripts/ - Scripts for the dashboard. How unexpected.
|   |   |    ├── dashload - Script to launch eww dashboard from a keybind. (No worky on WL)
|   |   |    ├── eww.scss - Ew.
|   |   |    ├── eww.yuck - ditto
|   |   |    └── launch_dashboard - Original form of dashload, unmodified. To be removed.
|   |   |
│   │   └── eww-dashboard/
|   |        ├── scripts/
|   |        |    └── custom-eww-sysinfo.sh
|   |        |
|   |        ├── eww.scss - Ew.
|   |        └── eww.yuck - ditto
|   |        
│   ├── hypr/
|   |   ├── hyprland.conf - My hyprland configuration. 
|   |   ├── hyprlandd.conf - Hyprland debug configuration.
|   |   └── Scripts
|   |       ├── Observant - Cleverly named screen recording script. Cr. to @taylor85345 
|   |       ├── hyprinit - XDGP launch script.
|   |       ├── launchUpdater - Launch kitty with special class, called by Waybar.
|   |       └── restartPipeWire.sh - Sometimes PipeWire breaks. So I restart it.
│   |
│   ├── kanshi/
|   |   └── config - Unnecessary, Hyprland has built-in monitor handling.
│   |
│   ├── kitty/
│   │    ├── kitty.conf - Kitty config. Defaults aside from font name and size. Also opacity.
│   │    ├── colors-dracula.conf - My old, dracula-esque kitty colorscheme.
│   │    └── colors-monochrome.conf - Guess what color scheme is this.
|   |
│   ├── mako/
|   |   └── config - Config for my previous notification daemon. Segfaults on hover now.
|   |
│   ├── micro/ - Defaults for micro text editor.
|   |
│   ├── neofetch/
│   │    ├── config.conf - Modified config
│   │    └── config-old.conf - Probably the defaults, not used in a while.
|   |
│   ├── nvim/ - NvChad defaults, plus some extra plugins. (Seems like a submodule for some reason)
|   |
│   ├── polybar/ - Unused, unclean. Steal at your own risk.
|   |
│   ├── rofi/
│   │    ├── config.rasi - Rofi config
│   │    ├── bin/ - Various rofi scriopts, most of them nonfunctional on Wayland.
│   │    ├── config/ - Includes configs for each rofi script.
│   │    └── themes/ - Includes themes for each rofi script.
│   ├── sway/ - Messy sway config directory. It's mostly stolen from other configs.
│   │    └── config - My Sway config, probably the only thing here that matters.
|   |
│   ├── swaync/
│   │    ├── config.json - Default.
│   │    ├── style.css - Slightly themed to be monochromatic.
│   │    └── presets 0-3 (0,1,2,3)
|   |
│   ├── sxhkd 
│   │    └── sxhkdrc - Used to pair this with bspwm, partially useless.
|   |
│   ├── waybar/
│   │    ├── config.json - Crème de la crème. Behold, my waybar config.
│   │    ├── style.css - Stupidly messsy waybay stylesheet.
│   │    └── config -> config.json (symlinked for waybar to read the config file)
|   |
│   ├── wlogout/
│   │    ├── layout - Default layout.
│   │    ├── style.css - Slightly themed to be monochromatic.
│   │    └── icons/ (WIP) monochrome icons for wlogout.
|   | 
│   ├── wofi/
│   │    └── style.css - Superior stylesheet for superior rofi.
|   | 
│   ├── wpaperd/
│   │    └── config - Speciifies wallpaper location and rotation duration. Heh.
|   |
│   ├── zsh/
│   │    ├── .zshrc
│   │    ├── aliases - My own aliases, apps and flatpak shorthands.
│   │    └── xdg-exports - Free thinkers when xdg-ninja tells them to clean their homedir.
|   |
|   └── mimeapps.list - I want this backed up. You probably don't want this.
└── README.md - The page you're reading right now.
```
