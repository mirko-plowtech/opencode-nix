# NixOS service configuration example for chief-coding-assistant
# This module demonstrates how to deploy the chief-coding-assistant config
# as a NixOS service with tilth in the PATH.
{ pkgs, ... }:

{
  services.opencode.instances.chief-assistant = {
    directory = "/srv/projects/my-project";
    listen.port = 8080;

    # Add tilth to PATH so MCP commands can find it
    path = [
      pkgs.tilth
      pkgs.git
      pkgs.ripgrep
    ];

    # Secrets should come from a runtime file (e.g., via sops-nix)
    environmentFile = "/run/secrets/opencode-chief-assistant";

    # Use the chief-coding-assistant configuration
    configFile = pkgs.lib.opencode.mkOpenCodeConfig [
      ../chief-coding-assistant
    ];
  };
}
