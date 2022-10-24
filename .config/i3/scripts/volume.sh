pamixer -t
if [[ $(pamixer --get-mute)  == "true" ]]; then
  dunstify -u low "Muted Volume"
else
  dunstify -u low "Unmuted Volume"
fi
