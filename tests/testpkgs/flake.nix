{
  inputs = {
    # NIXPKGS_PLACEHOLDER - This will be patched during tests to use the main flake's nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
    }:
    {
      packages = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed (system: {
        crate = nixpkgs.legacyPackages.${system}.callPackage (self + "/crate.nix") { };
        github = nixpkgs.legacyPackages.${system}.callPackage (self + "/github.nix") { };
        flake-use-update-script = nixpkgs.legacyPackages.${system}.callPackage (
          self + "/flake-use-update-script.nix"
        ) { };
      });
    };
}
