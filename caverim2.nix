{ pkgs, ... }:
pkgs.stdenv.mkDerivation rec {
  pname = "caverim2.x86_64";
  version = "2.0.0";

  pck = pkgs.fetchurl {
    url = "https://github.com/vesdev/caverim-nix/releases/download/v2.0.0/caverim2.pck";
    sha256 = "sha256:057eae4c6c298c294cc8131e7d934918bf2eff09e8748071be70aca910c1c220";
  };

  bin = pkgs.fetchurl {
    url = "https://github.com/vesdev/caverim-nix/releases/download/v2.0.0/caverim2.x86_64";
    sha256 = "sha256:757474b428da82739c62542f28ae8a532c5677c1a4521a15d59263decc3faad9";
  };

  dontUnpack = true;

  nativeBuildInputs = [
    pkgs.autoPatchelfHook
    pkgs.stdenv.cc.cc.lib
  ];

  runtimeDependencies = with pkgs; [
    xorg.libX11
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXi
    xorg.libxcb
    xorg.libXau
    xorg.libXdmcp
    xorg.libXext
    xorg.libXfixes
    xorg.libXrender
    dbus
    alsa-lib
    libGL
    openssl
    fontconfig
    vulkan-loader
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp ${pck} $out/bin/caverim2.pck
    cp ${bin} $out/bin/caverim2.x86_64
    chmod +x $out/bin/caverim2.x86_64
  '';
}
