{ config, pkgs, ...}:

{
  users.users.fil = {
     isNormalUser = true;
     shell = pkgs.zsh;
     extraGroups = [ "wheel" ]; 
     packages = with pkgs; [
       tree
     ];
   };  
}
