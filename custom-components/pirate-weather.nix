{ lib, buildHomeAssistantComponent, fetchFromGitHub, home-assistant }:

let pythonPackages = home-assistant.python.pkgs;
in buildHomeAssistantComponent rec {
  owner = "Pirate-Weather";
  domain = "pirateweather";
  version = "1.6.3";

  src = fetchFromGitHub {
    inherit owner;
    repo = "pirate-weather-ha";
    rev = "v${version}";
    hash = "sha256-jRe5KH3Rl2Vf22f7lI05p1IRecIrtH9ozsHh4qWHxP4=";
  };

  propagatedBuildInputs = with pythonPackages; [ colorlog python-forecastio ];

  meta = with lib; {
    changelog =
      "https://github.com/Pirate-Weather/pirate-weather-ha/releases/tag/v${version}";
    description =
      "Replacement for the default Dark Sky Home Assistant integration using Pirate Weather";
    homepage = "https://github.com/Pirate-Weather/pirate-weather-ha";
    maintainers = with maintainers; [ redxtech ];
    license = licenses.asl20;
  };
}
