let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-unstable";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [
    fuse-overlayfs
    ouch
  ];

  shellHook = "printf 'Contains:\nfuse-overlayfs\nouch'";
}
