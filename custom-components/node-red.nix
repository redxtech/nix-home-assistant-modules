{ lib, buildHomeAssistantComponent, fetchFromGitHub, home-assistant }:

let pythonPackages = home-assistant.python.pkgs;
in buildHomeAssistantComponent rec {
  owner = "zachowj";
  domain = "nodered";
  version = "4.1.2";

  src = fetchFromGitHub {
    inherit owner;
    repo = "hass-node-red";
    rev = "v${version}";
    hash = "sha256-qRQ4NMKmZUQ9wSYR8i8TPbQc3y69Otp7FSdGuwph14c=";
  };

  propagatedBuildInputs = with pythonPackages; [ colorlog ];

  meta = {
    changelog =
      "https://github.com/zachowj/hass-node-red/releases/tag/v${version}";
    description =
      "Companion Component for node-red-contrib-home-assistant-websocket to help integrate Node-RED with Home Assistant Core";
    homepage = "https://github.com/zachowj/hass-node-red";
    maintainers = with lib.maintainers; [ redxtech ];
    license = lib.licenses.mit;
  };
}
