{ stdenv, lib, nixos-container ? null }:

stdenv.mkDerivation rec {
  name = "extra-container-${version}";
  version = "0.3";

  propagatedBuildInputs = [
    nixos-container
  ];

  buildCommand = ''
    install -D ${./extra-container} $out/bin/extra-container
    patchShebangs $out/bin
  '';

  meta = with lib; {
    description = "Run declarative containers without full system rebuilds";
    homepage = https://github.com/erikarvstedt/extra-container;
    license = licenses.mit;
    maintainers = [ maintainers.earvstedt ];
  };
}
