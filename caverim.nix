{ pkgs, ... }:
pkgs.stdenv.mkDerivation rec {
  pname = "Caverim.x86_64";
  version = "1.0.0";

  pck = pkgs.fetchurl {
    url = "https://github.com/vesdev/caverim-nix/releases/download/v1.0.0/Caverim.pck";
    sha256 = "sha256-pdgm3MRmAtbgLGGOGpnuwp1PeFnA/s7PIsn8C918kNc=";
  };

  bin = pkgs.fetchurl {
    url = "https://github.com/vesdev/caverim-nix/releases/download/v1.0.0/Caverim.x86_64";
    sha256 = "sha256-ip2hOuqttsUSdtW900EXu7wr361LaW8qu5L2DiLsrhw=";
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
    cp ${pck} $out/bin/Caverim.pck
    cp ${bin} $out/bin/Caverim.x86_64
    chmod +x $out/bin/Caverim.x86_64
  '';
}
