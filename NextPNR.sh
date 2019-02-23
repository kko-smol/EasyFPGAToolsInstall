#!/usr/bin/env bash

pushd `dirname $0` > /dev/null
DIR=`pwd -P`
popd > /dev/null

UNAME_STR=`uname`

if [ ! -d $DIR/NextPNR ]; then
	echo "Checking out NextPNR..."
	git clone https://github.com/YosysHQ/nextpnr.git $DIR/NextPNR
else
	cd $DIR/NextPNR
	echo "Updating NextPNR..."
	git pull origin master || exit 1
fi

cd $DIR/NextPNR

echo "Building NextPNR..."
cmake -DARCH=ice40 .
make -j$(nproc)

echo "Installing NextPNR..."
if [[ "$UNAME_STR" == "Darwin" ]]; then
	make install
fi
if [[ "$UNAME_STR" == "Linux" ]]; then
	sudo make install
fi
