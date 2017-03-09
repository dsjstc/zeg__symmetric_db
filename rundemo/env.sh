#!/bin/bash

# DETAILS OF YOUR INSTALLATION
# -------------------------------------------------------------
# hard-code these if you wish.
export DEMO_DIR=$(dirname $(readlink -f $0))  # this is the rundemo directory
export SYM_HOME=/opt/symmetric-server-3.8.16/ # location of your symmetricDS install
export WORK_DIR=$(dirname $DEMO_DIR)/work/    # your working directory, to be created
export CORP_IP=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')

# A file that needs fixing in the symmetric bin directory
# -------------------------------------------------------------
export GOODSE=$DEMO_DIR/fixed-sym-setenv
export BADSE=$SYM_HOME/bin/setenv
