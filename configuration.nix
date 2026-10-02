{ config, lib, pkgs, inputs, ... }:
{
  imports =
    [ 
      ./hardware-configuration.nix
      #modules
      ./nix-modules/zapret.nix
      ./nix-modules/programs.nix
      ./nix-modules/nvidia.nix
      ./nix-modules/services.nix
      ./nix-modules/me-as-a-nixos-user.nix
    ];
  #moe
  networking.hostName = "nil";
  time.timeZone = "Asia/Yekaterinburg";

  #boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  #environment
  environment.variables = {
    EDITOR = "hx";
    VISUAL = "hx";
    QT_QPA_PLATFORMTHEME = "qt6ct";
  };
  environment.pathsToLink = ["/share/applications" "/share/xdg-desktop-portal" ];

  #pkgs  
  environment.systemPackages = with pkgs; [
     helix
     ghostty
     git
     fzf
     xwayland
     wget
     curl
     fastfetch
     wl-clipboard
     android-tools
     git-repo
     exfatprogs
     ntfs3g
     ntfsprogs
     cachix
     libnotify
     supergfxctl
     asusctl
     inputs.qml-niri.packages.${pkgs.stdenv.hostPlatform.system}.quickshell
     inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
     inputs.blender-cuda.packages.${pkgs.stdenv.hostPlatform.system}.blender-with-cuda-unstable
   ];
   nixpkgs.config.permittedInsecurePackages = [
                "ventoy-1.1.17"
    ];
  nix.settings = {
    substituters = [ "https://adithyagenie.cachix.org" ];
    trusted-public-keys = [ "adithyagenie.cachix.org-1:h6BSMboeVfxyrULWuRQqAyweo4AJRATekb88xotfQwc=" ];
  };
    
  #font pkgs
	fonts.packages = with pkgs; [
		nerd-fonts.jetbrains-mono
		corefonts
		vista-fonts
	];
	
  #nix settings
 	nixpkgs.config.allowUnfree = true;
	nix.settings.experimental-features = [ "nix-command" "flakes" ];





  #===========DANGER ZONE!!!!!!===============
  # scary setting!!!!!!
  # boooo
  system.stateVersion = "26.05";
}

