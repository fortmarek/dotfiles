#!/bin/sh
#
# Nix
#

# Check if nix exists
if test ! $(which nix-env)
then
  echo "  Installing Nix for you."
  echo " This will not work if you don't have a T2 chip"
  echo " Install nix manually following these instructions: https://www.philipp.haussleiter.de/2020/04/fixing-nix-setup-on-macos-catalina/"
  echo " Rerun after you are done"
  sh "<(curl -L https://nixos.org/nix/install)" --darwin-use-unencrypted-nix-store-volume
fi

if test ! $(which darwin-rebuild)
then
    echo " Installin nix darwin for you."
    nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
    ./result/bin/darwin-installer
    rm -rf result
fi

exit 0