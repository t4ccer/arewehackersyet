{
  description = "general-template";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    pre-commit-hooks-nix = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixpkgs-stable.follows = "nixpkgs";
    };
  };
  outputs =
    inputs @ { self
    , nixpkgs
    , ...
    }:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.pre-commit-hooks-nix.flakeModule
      ];

      systems = inputs.nixpkgs.lib.systems.flakeExposed;

      debug = true;

      perSystem =
        { config
        , self'
        , inputs'
        , lib
        , pkgs
        , system
        , ...
        }: {
          pre-commit.settings = {
            src = ./.;
            hooks = {
              nixpkgs-fmt.enable = true;
            };
          };

          devShells.default = pkgs.mkShell {
            shellHook = config.pre-commit.installationScript;
          };

          packages = {
            stats = import ./stats.nix pkgs;
          };

          apps = {
            fetchLists.program = pkgs.writeShellApplication {
              name = "fetch-lists";

              runtimeInputs = [
                pkgs.curl
                pkgs.gzip
                pkgs.ruby
                pkgs.jq
                pkgs.cacert
              ];

              text = ''
                set -euo pipefail
                packages="$(mktemp -u)"

                curl -Ss --fail https://mirror.fsmg.org.nz/kali/dists/kali-rolling/main/binary-amd64/Packages.gz | gunzip - > "$packages"

                ruby --encoding utf-8 parse-kali.rb < "$packages" | jq > kali-groups.json
                ruby --encoding utf-8 parse-kali-descs.rb < "$packages" | jq > kali-descriptions.json

                rm "$packages"
              '';
            };
          };

          formatter = pkgs.nixpkgs-fmt;
        };
    };
}
