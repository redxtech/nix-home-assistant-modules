{ ... }:

{
  perSystem = { pkgs, lib, ... }: {
    legacyPackages = let
      inherit (lib) packagesFromDirectoryRecursive;
      pythonPkgs = pkgs.home-assistant.python.pkgs;
    in {
      home-assistant-custom-components = (packagesFromDirectoryRecursive {
        inherit (pythonPkgs) callPackage;
        inherit (pkgs) newScope;
        directory = ./custom-components;
      });

      home-assistant-custom-lovelace-modules = (packagesFromDirectoryRecursive {
        inherit (pkgs) callPackage newScope;
        directory = ./custom-lovelace-modules;
      });

      pythonPackages = (packagesFromDirectoryRecursive {
        inherit (pythonPkgs) callPackage;
        inherit (pkgs) newScope;
        directory = ./python-packages;
      });
    };
  };
}
