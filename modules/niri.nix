{ pkgs, ...}:

{
  #niri
	wayland.windowManager.niri = {
		enable = true;
		extraConfig = ''
				output "eDP-1" {
					variable-refresh-rate
					mode "1920x1080@144.000"
				}
			'';
		settings = {
			blur = {
				on = {};
				passes = 4;
				noise = 0.01;
				saturation = 0.9;	
			};
			prefer-no-csd = {};
			hotkey-overlay.skip-at-startup = {};
			screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
			spawn-at-startup = ["noctalia"];
			layout = {
				focus-ring = {
					off = {};
				};
				border = {
					on = {};
					width = 2;
					active-color = "#ffffff";
					inactive-color = "#4d4d4d";
				};
				always-center-single-column = {};
				gaps = 4;
			};
			cursor = {
				xcursor-theme = "macOS";
				xcursor-size = 28;
			};

			input={
				focus-follows-mouse = {};
				touchpad = {
					tap = {};
					natural-scroll = {};
				};
				keyboard = {
					xkb = {
						layout = "us, ru";
						options = "grp:win_space_toggle";
					};
					numlock = {};
				};
			};
			
			binds = {
				"Mod+Return".spawn = ["ghostty" "+new-window"];
				"Mod+q".close-window = {};
				"Mod+b".spawn = ["zen"];
				"Mod+e".spawn-sh = ["ghostty -e yazi"];
				"Mod+slash".spawn-sh = ["noctalia msg panel-toggle launcher"];
				"Mod+period".spawn-sh = ["noctalia msg panel-toggle launcher"];
				
				"Mod+Left".focus-column-left = {};
				"Mod+Right".focus-column-right = {};
				"Mod+Up".focus-window-or-workspace-up = {};
				"Mod+Down".focus-window-or-workspace-down = {};

				"Mod+Shift+Left".move-column-left = {};
				"Mod+Shift+Right".move-column-right = {};
				"Mod+Shift+Down".move-window-down-or-to-workspace-down = {};
				"Mod+Shift+Up".move-window-up-or-to-workspace-up = {};

				"Mod+1".focus-workspace = 1;
				"Mod+2".focus-workspace = 2;
				"Mod+3".focus-workspace = 3;
				"Mod+4".focus-workspace = 4;
				"Mod+5".focus-workspace = 5;
				"Mod+6".focus-workspace = 6;
				"Mod+7".focus-workspace = 7;
				"Mod+8".focus-workspace = 8;
				"Mod+9".focus-workspace = 9;
				"Mod+0".focus-workspace = 10;


				"Mod+F".maximize-column = {};
				"Mod+R".switch-preset-column-width = {};
				"Mod+BracketLeft".consume-or-expel-window-left = {};
				"Mod+BracketRight".consume-or-expel-window-right = {};
				"Mod+o".toggle-overview = {};
				"Mod+Shift+f".fullscreen-window = {};
				"Mod+d".maximize-window-to-edges = {};
				"Mod+v".toggle-window-floating = {};

				"Print".spawn-sh = ["noctalia msg screenshot-fullscreen"];
				"Mod+Ctrl+S".spawn-sh = ["noctalia msg screenshot-fullscreen"];
				"Mod+Shift+s".spawn-sh = ["noctalia msg screenshot-region"];
				"Alt+Escape".spawn-sh = ["noctalia msg screenshot-region"];

				"XF86AudioRaiseVolume".spawn-sh = ["wpctl set-volume @DEFAULT_AUDIO_SINK@ '0.05+'"];
				"XF86AudioLowerVolume".spawn-sh = ["wpctl set-volume @DEFAULT_AUDIO_SINK@ '0.05-'"];
				"XF86AudioMute".spawn-sh = ["wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"];
				"XF86MonBrightnessDown".spawn-sh = ["brightnessctl --class=backlight set +10%"];
				"XF86MonBrightnessUp".spawn-sh = ["brightnessctl --class=backlight set 10%-"];
				"XF86AudioPlay".spawn-sh = ["playerctl play-pause"];
				"XF86AudioNext".spawn-sh = ["pllayerctl next"];
				"XF86AudioPrev".spawn-sh = ["pllayerctl previous"];
				"Mod+Shift+L".spawn-sh = ["noctalia msg panel-toggle session"];
				"Mod+Shift+W".spawn-sh = ["noctalia msg panel-toggle wallpaper"];
				"Mod+i".spawn-sh = ["noctalia msg settings-open"];
			};
			window-rule._children = [
				{ draw-border-with-background = false;}
				{ background-effect = {blur = true;};}
				{
					geometry-corner-radius = 12;
					clip-to-geometry = true;
				}
			];
			layer-rule._children = [
				{
					background-effect.blur = true;
					match._props = { namespace = "^noctalia-bar-default$";};
				}
			];
		};
	};
}
