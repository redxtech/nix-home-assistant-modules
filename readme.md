# nix-home-assistant-modules
>
> a collection of custom Home Assistant components and lovelace modules for use with nix.

## installation

add this repo to your flake.nix's inputs:

```nix
{
  inputs = {
    nix-home-assistant-modules.url = "github:redxtech/nix-home-assistant-modules";
  };
}
```

then consume the packages in your NixOS configuration:

```nix
{
    services.home-assistant = let
        nix-home-assistant-modules = inputs.nix-home-assistant-modules.legacyPackages.${system};
    in {
      customComponents = with nix-home-assistant-modules.home-assistant-custom-components; [];

      customLovelaceModules = with nix-home-assistant-modules.home-assistant-custom-lovelace-modules; [];
  };
}
```

## rationale

a lot of the most popular Home Assistant components and lovelace modules are not available in nixpkgs. this repo aims to provide a collection of custom components and lovelace modules that can be used with nix. addionally, their python dependencies have been included here as well, if they're missing from nixpkgs.
