{
  description = "Potentially hacky installer for flake programs using a shell profile method";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flakelight.url = "github:accelbread/flakelight";
  };

  outputs = { flakelight, ... }:
    flakelight ./. {
      lib = {
        mkDotprofileInstaller = { pkgs, ... }: import ./default.nix {
          inherit pkgs;
        };
      };
      package = pkgs: import ./default.nix { inherit pkgs; };
    };
}
