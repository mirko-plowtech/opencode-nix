let
  flake = builtins.getFlake (toString ./.);
  pkgs = import <nixpkgs> {
    overlays = [ flake.overlays.default ];
  };
in
  pkgs.lib.opencode.mkOpenCodeConfig [
    flake.nixosModules.example-chief-coding-assistant
  ]
