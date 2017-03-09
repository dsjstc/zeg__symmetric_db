#!/bin/bash
SYM_DEMO_DIR=$(dirname $(readlink -f $0))
. $SYM_DEMO_DIR/env.sh

# Fix things that need it
chmod ugo+x $SYM_DEMO_DIR/*.sh

if diff $SYM_GOOD_SETENV $SYM_BAD_SETENV > /dev/null; then 
	echo setenv already fixed
else
	if [ -w $SYM_INSTALL/bin/setenv ]; then
		cp $SYM_GOOD_SETENV $SYM_BAD_SETENV
		cp $SYM_DEMO_DIR/log4j.xml $SYM_INSTALL/conf/
	else 
		echo NEED SUDO TO FIX SYMMETRIC SETENV COMMAND
		sudo cp $SYM_GOOD_SETENV $SYM_BAD_SETENV
		sudo cp $SYM_DEMO_DIR/log4j.xml $SYM_INSTALL/conf/
		sudo rm -rf symhome/tmp/*
		sudo rm -rf symhome/logs/*
	fi
fi

if [ -w $SYM_INSTALL/bin/setenv ]; then
	cp $SYM_DEMO_DIR/fixed-sym-setenv $SYM_INSTALL/bin/setenv
	echo 'Cannot fix symmetric script, try again with sudo.'
	echo Exiting.
	exit 0;
fi


# Create needed directories, put work in workdir
mkdir -p /tmp/symmetricds/dump/
mkdir -p /tmp/symmetricds/tmp/
mkdir -p /tmp/symmetricds/log/

mkdir -p $SYM_WORK_DIR/output
cd $SYM_WORK_DIR
cp $SYM_DEMO_DIR/*.sh .

if [ ! -e symhome ]; then 	ln -s $SYM_INSTALL/ symhome; fi
if [ ! -e samples ]; then	ln -s $SYM_INSTALL/samples .; fi
if [ ! -e bin ]; then		ln -s $SYM_INSTALL/bin .; fi
cp $SYM_DEMO_DIR/*properties $SYM_WORK_DIR/

# Clean up from previous runs if necessary
if pgrep -f SymmetricLauncher ; then
	pkill -f SymmetricLauncher 
fi

rm -f *.sqlite
rm -f output/*
