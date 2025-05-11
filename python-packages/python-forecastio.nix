{ lib, fetchFromGitHub, home-assistant }:

let pythonPackages = home-assistant.python.pkgs;
in pythonPackages.buildPythonPackage {
  pname = "python-forecastio";
  version = "1.4.0";
  src = fetchFromGitHub {
    owner = "ZeevG";
    repo = "python-forecast.io";
    rev = "17bc91b6672b651db013adfae9d4584db56ef49a";
    hash = "sha256-ZINFP7vgyW53bgqpHabBJAKBqY5tHzTBrSoVl9hrmh0=";
  };

  meta = {
    description =
      "Thin Python Wrapper for the Dark Sky (formerly forecast.io) weather API";
    homepage = "https://zeevgilovitz.com/python-forecast.io/";
    maintainers = with lib.maintainers; [ redxtech ];
    license = lib.licenses.bsd2;
  };
}
