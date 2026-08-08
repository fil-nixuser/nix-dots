{
	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
		home-manager ={
			url = "github:nix-community/home-manager/master";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		fetch3d = {
			url = "github:areofyl/fetch";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		zen-browser = {
			url = "github:youwen5/zen-browser-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};
	outputs = { self, nixpkgs, home-manager, ...}@inputs: {
		nixosConfigurations.nil = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";

			specialArgs = { inherit inputs; };
			
			modules = [
				./configuration.nix
				home-manager.nixosModules.home-manager
				{
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						users.fil = import ./home.nix;
						backupFileExtension = "backup";
					};
				}
			];
		};
	};
}

