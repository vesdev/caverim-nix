{
  description = "flake for the single person using nixos";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    inputs@{ self
    , flake-parts
    , fenix
    , nixpkgs
    , ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
      ];

      perSystem =
        { pkgs, system, ... }:
        let
          caverim = import ./caverim { inherit pkgs; };
          caverim2 = import ./caverim2 { inherit pkgs; };
        in
        {
          packages = {
            inherit caverim caverim2;
          };
        };
    };
}
