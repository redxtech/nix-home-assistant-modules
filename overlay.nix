{ inputs, ... }:

{
  perSystem = { config, self', inputs', pkgs, system, lib, ... }: {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;

      overlays = [
        (self: super: {
          pythonPackagesExtensions = super.pythonPackagesExtensions ++ [
            (python-final: python-prev:
              let inherit (self'.legacyPackages) pythonPackages;
              in {
                resize-image = pythonPackages.resize-image;
                python-forecastio = pythonPackages.python-forecastio;
              })
          ];
        })
      ];
    };
  };
}
