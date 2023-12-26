{rev, pkgs}:
with builtins;
let
  kaliTools = pkgs.callPackage ./kali-tools.nix { };

  inherit (pkgs) lib;

  linkToPackage = pos:
    let
      withoutStore = lib.removePrefix builtins.storeDir pos;
      withoutHash = lib.concatStringsSep "/" (lib.drop 2 (lib.splitString "/" withoutStore));
      path =  lib.replaceStrings [":"] ["#L"] withoutHash;
    in "https://github.com/NixOS/nixpkgs/blob/${rev}/${path}";
in
mapAttrs
  (_: deps: listToAttrs (map
    (dep: {
      name = dep;
      value = rec {
        drv = kaliTools.${dep}.meta.name;
        link =
          if drv == "cantfind"
          then ""
          else
            let p = kaliTools.${dep}.meta.position or null;
            in if builtins.isString p
               then linkToPackage p
               else lib.warn "Could not determine position of ${dep}" "";
      };
    })
    deps))
  ((fromJSON (readFile ./kali-groups.json)))
