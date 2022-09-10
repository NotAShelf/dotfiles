<p align="center">
  <img width="25%" src="https://github.com/notashelf.png" />
</p>

<p align="center">
  <b>A repository for most things starting with a dot</b>
</p>

---

### Welcome fellow stranger

<img src="https://github.com/NotAShelf/dotfiles/blob/master/.github/assets/main.png" alt="img" align="right" width="400px">
<img src="https://github.com/NotAShelf/dotfiles/blob/master/.github/assets/logout.png" alt="img" align="right" width="400px">

This is where I periodically throw my configuration files. You might be here for 
something specific, in that case I recommend 
that you scroll below for the repository map and find what you are looking for

Here are some details about my setup:

+ **WM**: [Hyprland](https://github.com/hyprwm/Hyprland/) - *the* Wayland Compositor
+ **OS**: Arch Linux
+ **Shell**: [zsh](https://wiki.archlinux.org/index.php/Zsh)
+ **Terminal(s)**: [kitty](https://github.com/kovidgoyal/kitty/) & [Alacritty](https://github.com/alacritty/alacritty)
+ **Editor**: [Neovim](https://github.com/neovim/neovim/) w/ [NvChad](https://github.com/NvChad/NvChad)
+ **Org editor**: [Doom Emacs](https://github.com/hlissner/doom-emacs/)
+ **File Manager**: [Dolphin](https://github.com/KDE/dolphin)
+ **Launcher**: [Wofi](https://hg.sr.ht/~scoopta/wofi/) 
+ **Browser(s)**: Firefox & Waterfox (I use 3 browsers, shut up)

--- 

<img src="https://github.com/NotAShelf/dotfiles/blob/master/.github/assets/wofi.png" alt="img" align="left" width="400px">
<img src="https://github.com/NotAShelf/dotfiles/blob/master/.github/assets/terms.png" alt="img" align="left" width="400px">

### Main Applications

+ **Notification Daemon**: swaync
- **Bar**: Waybar
- **Wallpaper Daemon**: wpaperd
- **Application Menu**: Wofi
- **Polkit Agent**: xfce-polkit
- **Gamma Controller**: gammastep (only one that works on NVIDIA gpus)
- **Locker**: swaylock-effects (the mildly more updated fork)
- **Clipboard Manager**: Clipman 
- **Media**: MPD & nncmpp
- **Shell Prompt**: Oh My Zsh! + Powerlevel10k

You will find my configs for Hyprland, Swaync, Waybar and Wofi in the `.config` directory, should you be interested.

---

### Keyboard
| Keybind | Action |
| --- | --- |
| <kbd>super + enter</kbd> | Spawn terminal |
| <kbd>super + shift + enter</kbd> | Spawn floating terminal |
| <kbd>super + d</kbd> | Launch wofi |
| <kbd>super + shift + q</kbd> | Close active window |
| <kbd>super + control + space</kbd> | Toggle float for active window |
| <kbd>super + [1-0]</kbd> | Focus selected workspace |
| <kbd>super + [*(Asterisk)/Backspace] | "Special" workspaces. |
| <kbd>SUPER + shift + KP_Multiply (*) | Send to *special* workspace |
| <kbd>super + shift + [1-0]</kbd> | Send window to specified workspaces |
  
*... More to be documented later.*
  
---

## Notes
If you have any questions or issues, open an issue under this repository. If you have any suggestions for improvement, head to the "Pull Requests" section and make your changes. If you think this repository is confusing, you are (mostly) right. See the repository map below.

### Credits
Huge props to the awesome people listed below. If you like my dotfiles in the state they are in, it's most likely dude to how much those people inspired me (euphemism for stealing) with their configurations.

+ **[bauzin-32](https://github.com/bazuin-32/dotfiles)** - Most of my revamped zsh configuration and my new locking scripts from his dots. Awesome scripts, and incredibly neat dots. Massive thanks for having the dots open to public on Github.


## Repository Map

If you want to find something *before* you start looking into each individual directory, inspect the map below. It was tedious to create; but I hope it eases things for you, my fellow visitor.

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
