{ config, pkgs, ... }:

{
  #steam
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
      steamtinkerlaunch
    ];
  };
  
  #niri 
  programs.niri.enable = true;
  
  #shell 
  programs.zsh.enable = true;
  
  #security & networking 
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
