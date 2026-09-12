{ pkgs, ...}:

{
  programs.git = {
		enable = true;
		settings = {
			user = {
				name = "fil-nixuser";
				email = "fil228009ok@gmail.com";
			};			
		};
  };
}
