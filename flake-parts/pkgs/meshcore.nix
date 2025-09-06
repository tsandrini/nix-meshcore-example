{
  lib,
  python312Packages,
  pycayennelpp,
}:
python312Packages.buildPythonPackage rec {
  pname = "meshcore";
  version = "2.1.6";

  src = python312Packages.fetchPypi {
    inherit pname version;
    hash = "sha256-aEuY4N4QIJTPjonhtAYG97yIXnxKp1I5kt25pCiJjOM=";
  };

  nativeBuildInputs = with python312Packages; [
    hatchling
  ];

  propagatedBuildInputs = with python312Packages; [
    bleak
    pyserial-asyncio
    pycayennelpp
  ];

  pythonImportsCheck = [ "meshcore" ];

  pyproject = true;

  meta = with lib; {
    homepage = "https://github.com/meshcore-dev/meshcore_py";
    description = " Python bindings for meshcore ";
    license = licenses.mit;
    maintainers = with maintainers; [ tsandrini ];
  };
}
