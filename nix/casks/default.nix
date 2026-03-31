{ pkgs, lib, ... }:
let
  packagesJson = builtins.fromJSON (builtins.readFile ../../packages.json);
  packages = builtins.listToAttrs (map
    (cask: {
      name = cask.pname;
      value = pkgs.callPackage ./cask2derivation.nix { inherit cask; };
    })
    packagesJson);
in
  lib.optionalAttrs (lib.hasSuffix "darwin" pkgs.stdenv.hostPlatform.system) packages
