{ pkgs, ...}:

{
	#gvozd` programmi
	programs.ghostty = {
		enable = true;
		enableZshIntegration = true;
		settings = {
			theme = "noctalia";
			background = "#000000";
			background-opacity = 0.0;
			font-size = 11;
			shell-integration-features = ["ssh-terminfo" "ssh-env" ];
			confirm-close-surface = false;
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
			language-server.uwu_colors = {
				command = "${pkgs.uwu-colors}/bin/uwu_colors";
			};
			language = [
				{
					name = "nix";
					formatter.command = "alejandra";
					language-servers = [ "nixd" "uwu_colors" ];
					auto-format = true;
				}
				{
					name = "c";
					formatter.command = "clang-format";
					language-servers = [ "clangd" ];
					auto-format = true;
				}
				{
					name = "rust";
					formatter.command = "rustfmt";
					language-servers = ["rust-analyzer"];
					auto-format = true;
				}
			];
			
		};
		settings = {
			editor = {
				line-number = "relative"; 
				cursor-shape = {
					insert = "bar";
					normal = "block";
					select = "underline";
				};
				lsp = {
					display-messages = true;
				};
			};
			theme = "noctalia";
		};
	};

	
	#shell
	programs.zsh = {
		enable = true;
		initContent = "fastfetch";
		shellAliases = {
			nrs = "doas nixos-rebuild switch --flake /home/fil/.nix-dots#nil";
			nrb = "doas nixos-rebuild boot --flake /home/fil/.nix-dots#nil";
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
				color = { "1" = "white"; };			
			};
			display = {
				separator = " ";
				color = "white";
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
