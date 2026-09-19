{ pkgs, ...}:

{
	#gvozd` programmi
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

	#editor
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

	
	#shell
	programs.zsh = {
		enable = true;
		initContent = "fastfetch";
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

	
	#small stuff
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
	
	
	#fastfetch
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


	#fastfetch ascii
  
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
	};
}
