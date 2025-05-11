{ lib, buildHomeAssistantComponent, fetchFromGitHub, home-assistant }:

let pythonPackages = home-assistant.python.pkgs;
in buildHomeAssistantComponent rec {
  owner = "moralmunky";
  domain = "mail_and_packages";
  version = "0.4.2";

  src = fetchFromGitHub {
    inherit owner;
    repo = "Home-Assistant-Mail-And-Packages";
    rev = version;
    hash = "sha256-5LBTlRlkSUx8DOY+F7UvUs4dzjZKdBdgnDUdK6DBdew=";
  };

  propagatedBuildInputs = with pythonPackages; [ imageio resize-image ];

  meta = with lib; {
    changelog =
      "https://github.com/moralmunky/Home-Assistant-Mail-And-Packages/releases/tag/v${version}";
    description =
      "Home Assistant integration providing day of package counts and USPS informed delivery images.";
    homepage =
      "https://github.com/moralmunky/Home-Assistant-Mail-And-Packages/";
    maintainers = with maintainers; [ redxtech ];
    license = licenses.mit;
  };
}
