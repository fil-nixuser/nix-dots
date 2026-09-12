{ pkgs, ...}:

{
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
}
