{
  description = "Nix derivations for selected Homebrew casks";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }:
  let
    forDarwinSystems = f: nixpkgs.lib.genAttrs
      [ "aarch64-darwin" "x86_64-darwin" ]
      (system: f {
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        lib = nixpkgs.lib;
      });
  in {
    packages = forDarwinSystems ({ pkgs, lib }: import ./nix { inherit pkgs lib; });
  };
}
