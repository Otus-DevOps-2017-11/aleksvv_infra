#!/bin/bash
echo "Start deploy"

set -euxo pipefail
IFS=$'\n\t'

rm -rf reddit
git clone https://github.com/Otus-DevOps-2017-11/reddit.git
cd reddit && bundle install
puma -d
ps aux | grep puma

echo "End deploy"