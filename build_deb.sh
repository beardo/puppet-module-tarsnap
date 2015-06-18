#!/bin/sh

# Dependencies:
#   apt-get install sudo apt-get install ruby-dev gcc
#   gem install fpm

set -e

version=$1
url="https://www.tarsnap.com/download/tarsnap-autoconf-${version}.tgz"

wget -q -O - $url | tar -xz
fpm -s dir -t deb -n tarsnap tarsnap-autoconf-1.0.35/
rm -rf "tarsnap-autoconf-${version}"
