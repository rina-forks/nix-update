{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "fd";
  version = "8.0.0";

  src = fetchFromGitHub {
    owner = "sharkdp";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-xwLrg6V/4JhKjUwa/dMY/QrsAYA34xZu8ywlObfqKFA=";
  };
}
