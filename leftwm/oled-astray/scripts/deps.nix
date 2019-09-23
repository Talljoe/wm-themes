with import <nixpkgs> {};

runCommand "dummy" {
  buildInputs = [
    fish
    compton
    polybar
    feh
  ];
} ""