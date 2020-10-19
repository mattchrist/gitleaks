{pkgs ? import <nixpkgs> {}}:
pkgs.buildGoPackage rec {
  name = "gitleaks";
  version = "mc";
  goPackagePath = "github.com/zricethezav/gitleaks/v6"; 
  src = pkgs.nix-gitignore.gitignoreSource [] ./.;
  goDeps = ./deps.nix;
  postFixup = ''
    mv $out/bin/v6 $out/bin/gitleaks
  '';
}
