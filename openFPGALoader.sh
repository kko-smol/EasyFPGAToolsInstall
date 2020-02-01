#!/usr/bin/env bash

pushd `dirname $0` > /dev/null
DIR=`pwd -P`
popd > /dev/null

UNAME_STR=`uname`

if [ ! -d $DIR/NextPNR ]; then
	echo "Checking out openFPGALoader..."
	git clone https://github.com/trabucayre/openFPGALoader.git $DIR/openFPGALoader
else
	cd $DIR/openFPGALoader
	echo "Updating openFPGALoader..."
	git pull origin master || exit 1
fi

cd $DIR/openFPGALoader

echo "Building openFPGALoader..."
cmake ../
make -j$(nproc)

echo "Installing openFPGALoader..."
if [[ "$UNAME_STR" == "Darwin" ]]; then
	make install
fi
if [[ "$UNAME_STR" == "Linux" ]]; then
	sudo make install
fi
