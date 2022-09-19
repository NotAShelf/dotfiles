# flatpak aliases
#alias discord='flatpak run com.discordapp.Discord'
alias spotify='flatpak run com.spotify.Client'
alias flameshot='flatpak run org.flameshot.Flameshot'
alias zoom='flatpak run us.zoom.Zoom'
alias flatseal='flatpak run com.github.tchx84.Flatseal'

# my own aliases
alias grep='rg'  # ripgrep
alias  cat='bat' # bat
alias   ls='lsd' # lsd
alias maid='npm' # node package maid lol
alias find='fd'  # fd

# discord with funny gpu accel
alias discord='discord-canary --ignore-gpu-blocklist --disable-features=UseOzonePlatform --enable-features=VaapiVideoDecoder --use-gl=desktop --enable-gpu-rasterization --enable-zero-copy'

# zsh specific aliases
alias zshconfig='nano "$XDG_CONFIG_HOME"/zsh/.zshrc'
alias ohmyzsh='nano "$XDG_DATA_HOME"/oh-my-zsh/.oh-my-zsh'
