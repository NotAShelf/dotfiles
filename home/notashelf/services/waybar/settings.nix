{
  config,
  pkgs,
  lib,
}: {
  mainBar = {
    layer = "top";
    position = "left";
    width = 55;
    spacing = 7;
    fixed-center = true;
    exclusive = true;
    modules-left = [
      "custom/search"
      "wlr/workspaces"
      "custom/lock"
      "backlight"
      "battery"
      "custom/weather"
      "custom/todo"
    ];
    modules-center = [];
    modules-right = [
      "pulseaudio"
      "network"
      "custom/swallow"
      "clock"
      "custom/power"
    ];

    "wlr/workspaces" = let
      hyprctl = config.wayland.windowManager.hyprland.package + "/bin/hyprctl";
    in {
      on-click = "activate";
      on-scroll-up = "${hyprctl} dispatch workspace m+1";
      on-scroll-down = "${hyprctl} dispatch workspace m-1";
      format = "{icon}";
      active-only = true;
      format-icons = {
        "1" = "一";
        "2" = "二";
        "3" = "三";
        "4" = "四";
        "5" = "五";
        "6" = "六";
        "7" = "七";
        "8" = "八";
        "9" = "九";
        "10" = "十";
      };
    };

    "custom/search" = {
      format = " ";
      tooltip = false;
      on-click = "${pkgs.killall}/bin/killall rofi || ${config.programs.rofi.package}/bin/rofi -show drun";
    };

    "custom/todo" = {
      format = "{}";
      tooltip = true;
      interval = 7;
      exec = let
        todo = pkgs.todo + "/bin/todo";
        sed = pkgs.gnused + "/bin/sed";
        wc = pkgs.coreutils + "/bin/wc";
      in
        pkgs.writeShellScript "todo-waybar" ''
          #!/bin/sh

          total_todo=$(${todo} | ${wc} -l)
          todo_raw_done=$(${todo} raw done | ${sed} 's/^/      ◉ /' | ${sed} -z 's/\n/\\n/g')
          todo_raw_undone=$(${todo} raw todo | ${sed} 's/^/     ◉ /' | ${sed} -z 's/\n/\\n/g')
          done=$(${todo} raw done | ${wc} -l)
          undone=$(${todo} raw todo | ${wc} -l)
          tooltip=$(${todo})

          left="$done/$total_todo"

          header="<b>todo</b>\\n\\n"
          tooltip=""
          if [[ $total_todo -gt 0 ]]; then
          	if [[ $undone -gt 0 ]]; then
          		export tooltip="$header👷 Today, you need to do:\\n\\n $(echo $todo_raw_undone)\\n\\n✅ You have already done:\\n\\n $(echo $todo_raw_done)"
          		export output=" 🗒️ \\n $left"
          	else
          		export tooltip="$header✅ All done!\\n🥤 Remember to stay hydrated!"
          		export output=" 🎉 \\n $left"
          	fi
          else
          	export tooltip=""
          	export output=""
          fi

          printf '{"text": "%s", "tooltip": "%s" }' "$output" "$tooltip"
        '';
      return-type = "json";
    };

    "custom/weather" = let
      waybar-wttr = pkgs.stdenv.mkDerivation {
        name = "waybar-wttr";
        buildInputs = [
          (pkgs.python39.withPackages
            (pythonPackages: with pythonPackages; [requests]))
        ];
        unpackPhase = "true";
        installPhase = ''
          mkdir -p $out/bin
          cp ${./scripts/waybar-wttr.py} $out/bin/waybar-wttr
          chmod +x $out/bin/waybar-wttr
        '';
      };
    in {
      format = "{}";
      tooltip = true;
      interval = 30;
      exec = "${waybar-wttr}/bin/waybar-wttr";
      return-type = "json";
    };
    "custom/lock" = {
      tooltip = false;
      on-click = "${pkgs.bash}/bin/bash -c '(sleep 0.5s; ${lib.getExe pkgs.swaylock-effects} --grace 0)' & disown";
      format = "";
    };
    "custom/swallow" = {
      tooltip = false;
      on-click = let
        hyprctl = config.wayland.windowManager.hyprland.package + "/bin/hyprctl";
        notify-send = pkgs.libnotify + "/bin/notify-send";
        rg = pkgs.ripgrep + "/bin/rg";
      in
        pkgs.writeShellScript "waybar-swallow" ''
          #!/bin/sh
          if ${hyprctl} getoption misc:enable_swallow | ${rg} -q "int: 1"; then
          	${hyprctl} keyword misc:enable_swallow false >/dev/null &&
          	${notify-send} "Hyprland" "Turned off swallowing"
          else
          	${hyprctl} keyword misc:enable_swallow true >/dev/null &&
          	${notify-send} "Hyprland" "Turned on swallowing"
          fi
        '';
      format = "";
    };
    "custom/power" = {
      tooltip = false;
      on-click = let
        doas = pkgs.doas + "/bin/doas";
        rofi = config.programs.rofi.package + "/bin/rofi";
        poweroff = pkgs.systemd + "/bin/poweroff";
        reboot = pkgs.systemd + "/bin/reboot";
      in
        pkgs.writeShellScript "shutdown-waybar" ''

          #!/bin/sh

          off=" Shutdown"
          reboot=" Reboot"
          cancel=" Cancel"

          sure="$(printf '%s\n%s\n%s' "$off" "$reboot" "$cancel" |
          	${rofi} -dmenu -p ' Are you sure?')"

          if [ "$sure" = "$off" ]; then
          	${doas} ${poweroff}
          elif [ "$sure" = "$reboot" ]; then
          	${doas} ${reboot}
          fi
        '';
      format = "襤";
    };
    clock = {
      format = ''
        {:%H
        %M}'';
      tooltip-format = ''
        <big>{:%Y %B}</big>
        <tt><small>{calendar}</small></tt>'';
    };

    backlight = let
      brightnessctl = lib.getExe pkgs.brightnessctl;
    in {
      format = "{icon}";
      format-icons = ["󰋙" "󰫃" "󰫄" "󰫅" "󰫆" "󰫇" "󰫈"];
      #format-icons = ["" "" "" "" "" "" "" "" ""];
      on-scroll-up = "${brightnessctl} s 1%-";
      on-scroll-down = "${brightnessctl} s +1%";
    };

    battery = {
      states = {
        warning = 30;
        critical = 15;
      };
      format = "{icon}";
      format-charging = "";
      format-plugged = "";
      format-alt = "{icon}";
      format-icons = ["" "" "" "" "" "" "" "" "" "" "" ""];
    };
    network = {
      format-wifi = "󰤨";
      format-ethernet = "󰈀";
      format-alt = "󱛇";
      format-disconnected = "󰤭";
      tooltip-format = "{ipaddr}/{ifname} via {gwaddr} ({signalStrength}%)";
    };
    pulseaudio = {
      scroll-step = 5;
      tooltip = false;
      format = "{icon}";
      format-icons = {default = ["" "" "墳"];};
      on-click = "${pkgs.killall}/bin/killall pavucontrol || ${pkgs.pavucontrol}/bin/pavucontrol";
    };
  };
}