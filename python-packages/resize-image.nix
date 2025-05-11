{ lib, fetchFromGitHub, home-assistant }:

let pythonPackages = home-assistant.python.pkgs;
in pythonPackages.buildPythonPackage {
  pname = "resize-image";
  version = "0-unstable-2021-11-04";
  src = fetchFromGitHub {
    owner = "VingtCinq";
    repo = "python-resize-image";
    rev = "9c9a1f6d61abf3f5072ca0934963fcd75ed24c08";
    hash = "sha256-Emk/k8kzhFiWtpU7DOtqbrn5xAaJUT3yeZmnYmke2lQ=";
  };

  propagatedBuildInputs = with pythonPackages; [ beautifulsoup4 dateparser ];

  meta = {
    description = "Small python package to easily resize images";
    homepage = "https://github.com/VingtCinq/python-resize-image";
    maintainers = with lib.maintainers; [ redxtech ];
    license = lib.licenses.mit;
  };
}
