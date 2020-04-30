#!/usr/bin/env bash

pushd `dirname $0` > /dev/null
DIR=`pwd -P`
popd > /dev/null

PYTHONVERSION=$(python3 --version 2>&1 | egrep -o '3\.[0-9]+')
UNAME_STR=`uname`

if [ ! -d $DIR/prjtrellis ]; then
	echo "Checking out prjtrellis..."
	 git clone --recursive https://github.com/SymbiFlow/prjtrellis $DIR/prjtrellis
	cd $DIR/prjtrellis/
else
	cd $DIR/prjtrellis
	echo "Updating prjtrellis..."
	git pull origin master || exit 1
fi

cd $DIR/prjtrellis/libtrellis

echo "Building prjtrellis..."
cmake -DCMAKE_INSTALL_PREFIX=/usr .
make

echo "Installing prjtrellis..."
if [[ "$UNAME_STR" == "Darwin" ]]; then
	make install
else
	sudo make install
fi
