{ config, pkgs, inputs, ...}:

{
	home.username = "fil";
	home.homeDirectory = "/home/fil";
	programs.firefox.enable = true;
	home.stateVersion = "26.05";
	home.pointerCursor = {
		enable = true;
  	gtk.enable = true;
  	x11.enable = true;
  	package = pkgs.apple-cursor;
  	name = "macOS";
  	size = 24;
	};
	home.packages = with pkgs; [
		#useful stuff
		wev 
		qimgv
		brightnessctl
		playerctl
		usbutils
		unzip
		libreoffice-stable
		gparted
		ventoy-full
		udisks2
		ytmdesktop
		qbittorrent
		gale
		#nix lang
		nixd
		alejandra
		#c`s shit
		clang-tools
		gnumake
		clang
		lldb
		#quickshell stuff
		qt6.qtdeclarative
		noctalia
		#messanger
		mumble
		element-desktop
		#wine
		winetricks
		wine
		#small stuff
		lsd
		bat
		ripgrep
		fd
		bottom
		dysk
	];
	home.file.".config/fastfetch/ascii.txt" = {
		text = ''
                __    __ 
         /¯\    \  \ /  ;
         \  \    \  v  /  
      /¯¯¯   ¯¯¯¯\\   /  /\
     ’————————————·\  \ /  ;
          /¯¯;      \ //  /_
    _____/  /        ‘/     \
    \      /,        /  /¯¯¯¯
     ¯¯/  // \      /__/     
      .  / \  \·————————————.
       \/  /   \\_____   ___/
          /  ,  \     \  \   
          \_/ \__\     \_/   
			'';
		executable = true;
	};
	services.awww.enable = true;
	programs.git = {
		enable = true;
		settings = {
			user = {
				name = "fil-nixuser";
				email = "fil228009ok@gmail.com";
			};			
		};
	};
	programs.fzf = {
		enable = true;
		enableZshIntegration = true;
	};
	programs.starship = {
		enable = true;
		enableZshIntegration = true;
	};
	programs.zoxide = {
		enable = true;
		enableZshIntegration = true;
	};
	programs.fastfetch = {
		enable = true;
		settings = {
			logo = {
				source = "~/.config/fastfetch/ascii.txt";
			};
			display = {
				separator = " ";
			};
			modules = [
				{
					key = "╭───────────╮";
					type = "custom";
				}
				{
					key = "│  user    │";
					type = "title";
					format = "{user-name}";
				}
				{
					key = "│ 󰇅 hname   │";
					type = "title";
					format = "{host-name}";
				}
				{
					key = "│ 󰅐 uptime  │";
					type = "uptime";
				}
				{
					key = "│  distro  │";
					type = "os";
				}
				{
					key = "│  kernel  │";
					type = "kernel";
				}
				{
					key = "│  wm      │";
					type = "wm";
				}
				{
					key = "│  term    │";
					type = "terminal";
				}
				{
					key = "│  shell   │";
					type = "shell";
				}
				{
					key = "│ 󰍛 cpu     │";
					type = "cpu";
					showPeCoreCount = true;
					format = "{name}";
				}
				{
					key = "│ 󰉉 disk    │";
					type = "disk";
					folders = "/";
				}
				{
					key = "│  memory  │";
					type = "memory";
				}
				{
					key = "├───────────┤";
					type = "custom";
				}
				{
					key = "│  colors  │";
					type = "colors";
					symbol = "circle";
				}
				{
					key = "╰───────────╯";
					type = "custom";
				}
			];
		};
	};
	programs.hyprlock = {
		enable = true;
		settings = {
			general = {
				ignore_empty_input = true;
			};
			animations = {
				enable = true;
			};
			background = [
				{
					path = "~/Pictures/wallpaper.jpg";
					blur_passes = 4;
					blur_size = 10;
				}
			];
			input-field = [
				{
					size = "200, 50";
					position = "0, -100";
					dots_center = true;
				}
			];
			label = [
				{
					text = "$TIME";
					font_size = 90;
					font_family = "JetBrains Nerd Font Mono";
					halign = "center";
					valign = "center";
				}
			];
		};
	};
	programs.fuzzel = {
		enable = true;
		settings = {
			main = {
				terminal = "${pkgs.ghostty}/bin/ghostty -e";
				layer = "overlay";
			};
			colors = {
				background = "00000000";
				border = "ffffffff";
				selection = "000000ff";
				selection-text = "ffffffff";
				text = "ffffffff";
			};
			border = {
				radius = 0;
				width = 2;
			};
		};
	};
	
	programs.yazi = {
		enable = true;
		enableZshIntegration = true;
		plugins = {
			smart-enter = pkgs.fetchFromGitHub {
				owner = "yazi-rs";
				repo = "plugins";
				rev = "0be29a913ad61c6d119abfaaf253e96e6af5db67";
				hash = "sha256-IDmmXzQKFx3QZ9u5lMwcTOeWeMPWzIBeKBXkGAgJMaI=";
			} + "/smart-enter.yazi";
			mount = pkgs.fetchFromGitHub {
				owner = "yazi-rs";
				repo = "plugins";
				rev = "0be29a913ad61c6d119abfaaf253e96e6af5db67";
				hash = "sha256-IDmmXzQKFx3QZ9u5lMwcTOeWeMPWzIBeKBXkGAgJMaI=";
			} + "/mount.yazi";
		};
		keymap = {
			mgr.prepend_keymap = [
				{
					on = "<Enter>";
					run = "plugin smart-enter";
				}
				{
					on = "M";
					run = "plugin mount";
				}
			];
		};
	};
	programs.waybar = {
		enable = false;
		settings = {
			mainBar = {
				layer = "top";
				position = "left";
				width = 12;

				modules-left = [
					"custom/icon"
					"niri/workspaces" 
				];
				modules-center = [
					"clock"
				];
				modules-right = [
					"wireplumber"
					"backlight"
					"battery"
					"network"
					"custom/power"
				];
				"wireplumber" = {
					scroll-step = 5;
					format = "{icon}";
					format-muted = "󰝟";
					tooltip = true;
					tooltip-format = "{volume}%";
					tooltip-format-muted = "muted";
					format-icons = {
						default = ["󰕿" "󰖀" "󰕾"];
						headphones = "󰋋";
						headset = "󰋎";
					};
				};
				backlight = {
					device = "intel-backlight";
					format = "{icon}";
					tooltip-format = "{percent}%";
					format-icons = ["󰃞" "󰃟" "󰃠"];
				};
				"custom/icon" = {
					format = "";
					on-click = "fuzzel";
				};
				"custom/power" = {
					format = "󰐥";
					on-click = "~/.config/scripts/power-menu.sh";
				};
				battery = {
					states = {
						warning = 30;
						critical = 15;
					};
					format = " {icon}";
					format-charging = "󰂄";
					format-plugged = "󱟦";
					format-full = "󰁹";
					tooltip-format = "{capacity}%";
					tooltip-format-charging = "charging {capacity}%";
					tooltip-format-plugged = "plugged {capacity}%";
					tooltip-format-full = "full";
					format-icons = [
						"󰂎"
						"󰁺"
						"󰁻"
						"󰁼"
						"󰁽"	
						"󰁾"
						"󰁿"
						"󰂀"
						"󰂁"
						"󰂂"
						"󰁹"
					];
				};
				clock = {
					format = "{:%H\n%M}";
				};
				network = {
					format-wifi = "󰤨";
					format-disconnected = "󰤭";
					tooltip-format-wifi = "{signalStrength}";
					tooltip-format-disconnected = "disconnected";
					on-click = "ghostty +new-window -e nmtui";
				};
			};
		};
		style = "
				* {
					font-family: JetBrains Nerd Font Mono;
					font-size: 14px;
					color: #ffffff;
				}
				window#waybar {
					background: transparent;
					border-radius: 0px;
				}
				#workspaces button {
					margin: 4px 0px;
					border-radius: 0px;
					background: transparent;
					color: #ffffff;
					border: none;
				}
				#workspaces button.active {
					border-right: 2px solid #ffffff;
				}
				#workspaces button.hover {
					background: #1e1e1e;
				}
				#workspaces button.urgent {
					background: #5b4950;
				}
				#battery{
					margin: 4px 0px;
				}
				#battery.warning {
			    background: rgba(246, 193, 119, 0.15);
				}

				#battery.critical {
    			background: rgba(235, 111, 146, 0.18);
				}

				#wireplumber.muted {
    			opacity: 0.6;
				}
				tooltip {
			    background: #111111;
    			border: 1px solid #333333;
    			margin-left: 20px;
				}

				tooltip label {
    			color: #e0def4;
    			font-size: 11px;
				}
				#wireplumber {
					margin: 4px 0px;
					font-size: 16px;
				}
				#backlight {
					margin-top: 4px;
					margin-bottom: 4px;
					margin-right: 4px;
				}
				#custom-icon {
					padding-bottom: 4px;
					padding-top: 6px;
					font-size: 16px;
				}
				#network {
					margin-bottom: 6px;
					margin-top: 6px;
					font-size: 16px;
					margin-right: 4px;
				}
				#custom-power {
					padding-bottom: 6px;
					padding-top: 4px;
					font-size: 16px;
				}
				#custom-icon {
					margin-right:2px;
				}
			";
	};
	
	programs.ghostty = {
		enable = true;
		enableZshIntegration = true;
		settings = {
			theme = "Nord Wave";
			background = "#000000";
			background-opacity = 0.0;
			font-size = 11;
			shell-integration-features = ["ssh-terminfo" "ssh-env" "sudo"];
			keybind = [
				"alt+e=new_split:auto"
				"alt+q=close_surface"
				"alt+arrow_left=goto_split:left"
				"alt+arrow_right=goto_split:right"
				"alt+arrow_up=goto_split:up"
				"alt+arrow_down=goto_split:down"
				"alt+/=start_search"
				];
		};
	};
	programs.helix = {
		enable = true;
		languages = {
			language = [
				{
					name = "nix";
					formatter = {
						command = "alejandra";
					};
				}
				{
					name = "c";
					formatter.command = "clang-format";
				}
			];
			
		};
		settings = {
			editor = {
				cursor-shape = {
					insert = "bar";
					normal = "block";
					select = "underline";
				};
				lsp = {
					display-messages = true;
				};
			};
			theme = "base16_transparent";
		};
	};
	programs.zsh = {
		enable = true;
		shellAliases = {
			nrs = "sudo nixos-rebuild switch --flake ~/.nix-dots#nil";
			nixconf = "hx ~/.nix-dots/configuration.nix";
			nrb = "sudo nixos-rebuild boot --flake ~/.nix-dots#nil";
			hmconf = "hx ~/.nix-dots/home.nix";
			flkconf = "hx ~/nix-dots/flake.nix";
			ls = "lsd";
			cat = "bat";
			cd = "z";
			ff = "fastfetch";
		};
		fastSyntaxHighlighting.enable = true;
		autosuggestion.enable = true;
	};
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
