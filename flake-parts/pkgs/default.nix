# --- flake-parts/pkgs/default.nix
{ lib, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages = rec {
        default = meshcore;

        meshcore = pkgs.callPackage ./meshcore.nix { inherit pycayennelpp; };
        pycayennelpp = pkgs.callPackage ./pycayennelpp.nix { };
      };
    };
}
