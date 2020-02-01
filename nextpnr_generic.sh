#!/usr/bin/env bash

pushd `dirname $0` > /dev/null
DIR=`pwd -P`
popd > /dev/null

UNAME_STR=`uname`

if [ ! -d $DIR/NextPNR ]; then
	echo "Checking out nextpnr..."
	git clone https://github.com/YosysHQ/nextpnr.git $DIR/nextpnr
else
	cd $DIR/nextpnr
	echo "Updating nextpnr_generic..."
	git pull origin master || exit 1
fi

cd $DIR/nextpnr

echo "Building nextpnr_generic..."
cmake -DARCH=generic .
make -j$(nproc)

echo "Installing nextpnr_generic..."
if [[ "$UNAME_STR" == "Darwin" ]]; then
	make install
fi
if [[ "$UNAME_STR" == "Linux" ]]; then
	sudo make install
fi
