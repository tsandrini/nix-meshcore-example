{
  lib,
  python312Packages,
}:
python312Packages.buildPythonPackage rec {
  pname = "pycayennelpp";
  version = "2.4.0";

  src = python312Packages.fetchPypi {
    inherit pname version;
    hash = "sha256-vfXj5pjOQOZsUGV5Q0DnFJwRR/P9mEOOfqcohcSnhrE=";
  };

  nativeBuildInputs = with python312Packages; [
    setuptools
  ];

  postPatch = ''
    substituteInPlace setup.py --replace-warn '"pytest-runner"' ""
  '';

  format = "setuptools";

  pythonImportsCheck = [ "cayennelpp" ];

  meta = with lib; {
    homepage = "http://github.com/smlng/pycayennelpp";
    description = "Encoder and Decoder for CayenneLPP";
    license = licenses.mit;
    maintainers = with maintainers; [ tsandrini ];
  };
}
