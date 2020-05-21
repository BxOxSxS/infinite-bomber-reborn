#!/bin/sh

export CGO_ENABLED=1
export CFLAGS='-w -O2'
export CGO_CFLAGS="$CFLAGS"
export CGO_CPPFLAGS="$CFLAGS"
export CGO_CXXFLAGS="$CFLAGS"
export CGO_FFLAGS="$CFLAGS"
export CGO_LDFLAGS="$CFLAGS"

echo 'Kompilowanie pliku binarnego linux-x86...'
mkdir -p ./builds/linux/Infinite-Bomber-x86
GOOS=linux GOARCH=386 go build -o ./builds/linux/Infinite-Bomber-x86/infinite-bomber -gcflags="all=-trimpath=$HOME" -asmflags="all=-trimpath=$HOME" -ldflags="-s -w"

echo 'Kopiowanie plików tor...'
rm -r ./tor-files/Data/data*
mkdir -p ./builds/linux/Infinite-Bomber-x86/tor
cp -r ./tor-files/Data ./builds/linux/Infinite-Bomber-x86/tor/
cp -r ./tor-files/torrc ./builds/linux/Infinite-Bomber-x86/tor/

echo 'Kompilowanie pliku binarnego linux-x64...'
mkdir -p ./builds/linux/Infinite-Bomber-x64
GOOS=linux GOARCH=amd64 go build -o ./builds/linux/Infinite-Bomber-x64/infinite-bomber -gcflags="all=-trimpath=$HOME" -asmflags="all=-trimpath=$HOME" -ldflags="-s -w"

echo 'Kopiowanie plików tor...'
rm -r ./tor-files/Data/data*
mkdir -p ./builds/linux/Infinite-Bomber-x64/tor
cp -r ./tor-files/Data ./builds/linux/Infinite-Bomber-x64/tor/
cp -r ./tor-files/torrc ./builds/linux/Infinite-Bomber-x64/tor/

echo 'Kompilowanie pliku binarnego linux-arm...'
mkdir -p ./builds/linux/Infinite-Bomber-arm
CC=arm-linux-gnueabi-gcc CXX=arm-linux-gnueabi-g++ GOOS=linux GOARCH=arm go build -o ./builds/linux/Infinite-Bomber-arm/infinite-bomber -gcflags="all=-trimpath=$HOME" -asmflags="all=-trimpath=$HOME" -ldflags="-s -w"

echo 'Kopiowanie plików tor...'
rm -r ./tor-files/Data/data*
mkdir -p ./builds/linux/Infinite-Bomber-arm/tor
cp -r ./tor-files/Data ./builds/linux/Infinite-Bomber-arm/tor/
cp -r ./tor-files/torrc ./builds/linux/Infinite-Bomber-arm/tor/

echo 'Kompilowanie pliku binarnego linux-arm64...'
mkdir -p ./builds/linux/Infinite-Bomber-arm64
CC=aarch64-linux-gnu-gcc CXX=aarch64-linux-gnu-g++ GOOS=linux GOARCH=arm64 go build -o ./builds/linux/Infinite-Bomber-arm64/infinite-bomber -gcflags="all=-trimpath=$HOME" -asmflags="all=-trimpath=$HOME" -ldflags="-s -w"

echo 'Kopiowanie plików tor...'
rm -r ./tor-files/Data/data*
mkdir -p ./builds/linux/Infinite-Bomber-arm64/tor
cp -r ./tor-files/Data ./builds/linux/Infinite-Bomber-arm64/tor/
cp -r ./tor-files/torrc ./builds/linux/Infinite-Bomber-arm64/tor/

echo 'Gotowe!'
