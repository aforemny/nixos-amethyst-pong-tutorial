{ pkgs ? import <nixpkgs> {} }:
with pkgs;
with stdenv;
mkDerivation {
  name = "amethyst";
  buildInputs = [
    alsaLib
    binutils
    cargo
    cmake
    expat
    freetype
    gcc
    gnumake
    openssl
    pkgconfig
    rustc
    xorg.libxcb
  ];
  shellHook = ''
    export PATH=~/.cargo/bin:$PATH
  '';
  LD_LIBRARY_PATH="${lib.makeLibraryPath [
    libGL_driver
    libGLU_combined
    libglvnd
    xorg.libX11
    xorg.libXcursor
    xorg.libXi
    xorg.libXrandr
  ]}";
}
