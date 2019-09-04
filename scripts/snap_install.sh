#!/bin/bash --

set -e

sudo apt update
sudo /snap/bin/lxd.migrate -yes
sudo /snap/bin/lxd waitready
sudo /snap/bin/lxd init --auto
