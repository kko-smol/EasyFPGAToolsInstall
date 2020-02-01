#!/usr/bin/env bash

pushd `dirname $0` > /dev/null
DIR=`pwd -P`
popd > /dev/null

UNAME_STR=`uname`

if [ ! -d $DIR/apicula ]; then
  echo "Getting dependencies" 
  pip install numpy pandas pillow crcmod xlrd ipython
	echo "Checking out apicula..."
	git clone https://github.com/pepijndevos/apicula.git $DIR/apicula
else
	cd $DIR/apicula
	echo "Updating apicula..."
	git pull origin master || exit 1
fi

cd $DIR/apicula

echo "Built apicula..."


echo "Installed nextpnr..."
