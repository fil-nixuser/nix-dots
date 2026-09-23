{ pkgs, ...}:

{
  programs.yazi = {
		enable = true;
		enableZshIntegration = true;
		theme = {
			mgr.border_symbol = " ";
		};
		initLua = ''
			Header:children_add(function()
    if ya.target_family() == "unix" then
        return ui.Span(ya.user_name() .. "@" .. ya.host_name() .. ":"):fg("green"):bold()
    end
    return ui.Span("")
end, 500, Header.LEFT)
			'';
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
