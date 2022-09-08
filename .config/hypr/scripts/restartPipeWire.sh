#!/bin/bash

echo -en "Restarting pipewire & pipewire-pulse\n"
time systemctl --user restart pipewire pipewire-pulse
echo -en "\n"

echo -en "Reloading daemon\n"
time systemctl --user daemon-reload
echo -en "\n"
