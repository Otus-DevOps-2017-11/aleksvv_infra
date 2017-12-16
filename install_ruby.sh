#!/bin/bash
echo "Start ruby install"

set -euxo pipefail
IFS=$'\n\t'

sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential

ruby -v
bundle -v

echo "End ruby install"
