{ config, pkgs, ...}:

{
	home.username = "fil";
	home.homeDirectory = "/home/fil";
	home.stateVersion = "26.05";
	home.pointerCursor = {
		enable = true;
  	gtk.enable = true;
  	x11.enable = true;
  	package = pkgs.apple-cursor;
  	name = "macOS";
  	size = 24;
	};

	#imports
	imports = [
		./modules/terminal.nix
		./modules/niri.nix
		./modules/file-manager.nix
		./modules/git.nix
	];

	#packages
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

	services.awww.enable = true;
}
