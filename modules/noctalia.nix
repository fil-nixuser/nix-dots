{ config, pkgs, ... }:

{
  programs.noctalia = {
    enable = true;
    checkConfig = true;
  };
}
