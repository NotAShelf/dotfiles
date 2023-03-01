# flatpak aliases
#alias discord='flatpak run com.discordapp.Discord'
alias spotify='flatpak run com.spotify.Client'
alias zoom='flatpak run us.zoom.Zoom'
alias flatseal='flatpak run com.github.tchx84.Flatseal'
alias protontricks='flatpak run com.github.Matoking.protontricks'
alias qbittorrent='flatpak run org.qbittorrent.qBittorrent'
alias gimp='flatpak run org.gimp.GIMP'
alias flatseal='flatpak run com.github.tchx84.Flatseal'
alias obs='flatpak run com.obsproject.Studio'
alias bottles='flatpak run com.usebottles.bottles'
alias openshot='flatpak run org.openshot.OpenShot'
alias onlyoffice='QT_QPA_PLATFORM=xcb flatpak run org.onlyoffice.desktopeditors'
alias librewolf='flatpak run io.gitlab.librewolf-community'
alias discover_overlay='flatpak run io.github.trigg.discover_overlay'
#alias webcord='flatpak run io.github.spacingbat3.webcord'

# my own aliases
alias grep='rg'  # ripgrep
alias  cat='bat' # bat
alias   ls='lsd --group-directories-first' # lsd
alias maid='npm' # node package maid lol
alias find='fd'  # fd

# discord with funny gpu accel
#alias discord='discord-canary --ignore-gpu-blocklist --disable-features=UseOzonePlatform --enable-features=VaapiVideoDecoder --use-gl=desktop --enable-gpu-rasterization --enable-zero-copy'

# zsh specific aliases
alias zshconfig='nano "$XDG_CONFIG_HOME"/zsh/.zshrc'
alias ohmyzsh='nano "$XDG_DATA_HOME"/oh-my-zsh/.oh-my-zsh'

# xdg-specific aliases
alias nvidia-settings='nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings'
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME"/yarn/config'
alias polymc='polymc --dir "$XDG_DATA_HOME"/minecraft'
alias svn="svn --config-dir $XDG_CONFIG_HOME/subversion"
