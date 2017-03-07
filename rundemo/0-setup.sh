#!/bin/bash
DEMO_DIR=$(dirname $(readlink -f $0))
. $DEMO_DIR/env.sh

# Fix things that need it
if diff $GOODSE $BADSE > /dev/null; then 
	echo setenv already fixed
else
	if [ -w $SYM_HOME/bin/setenv ]; then
		cp $GOODSE $BADSE
		cp $DEMO_DIR/log4j.xml $SYM_HOME/conf/
	else 
		echo NEED SUDO TO FIX SYMMETRIC SETENV COMMAND
		sudo cp $GOODSE $BADSE
		sudo cp $DEMO_DIR/log4j.xml $SYM_HOME/conf/
		sudo rm -rf symhome/tmp/*
		sudo rm -rf symhome/logs/*
	fi
fi

if [ -w $SYM_HOME/bin/setenv ]; then
	cp $DEMO_DIR/fixed-sym-setenv $SYM_HOME/bin/setenv
	echo 'Cannot fix symmetric script, try again with sudo.'
	echo Exiting.
	exit 0;
fi


# Create needed directories, put work in workdir
mkdir -p /tmp/symmetricds/dump/
mkdir -p /tmp/symmetricds/tmp/
mkdir -p /tmp/symmetricds/log/

mkdir -p $WORK_DIR/output
cd $WORK_DIR
if [ ! -e symhome ]; then 	ln -s $SYM_HOME/ symhome; fi
if [ ! -e samples ]; then	ln -s $SYM_HOME/samples .; fi
if [ ! -e bin ]; then		ln -s $SYM_HOME/bin .; fi
cp $DEMO_DIR/*properties $WORK_DIR/

# Clean up from previous runs if necessary
if pgrep -f SymmetricLauncher ; then
	pkill SymmetricLauncher 
fi

rm -f *.sqlite
rm -f output/*
