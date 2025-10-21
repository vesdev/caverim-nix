{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  pname = "Caverim.x86_64";
  version = "v0.13.1";
  src = ./.;

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
    runHook preInstall

    mkdir -p $out/bin
    cp $src/Caverim.*{pck,x86_64} $out/bin/
    chmod +x $out/bin/Caverim.x86_64

    runHook postInstall
  '';
}
