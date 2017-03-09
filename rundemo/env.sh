#!/bin/bash

# DETAILS OF YOUR INSTALLATION
# -------------------------------------------------------------
# hard-code these if you wish.
export SYM_DEMO_DIR=$(readlink -f $(dirname ${BASH_SOURCE[0]}))
export SYM_INSTALL=/opt/symmetric-server-3.8.16/ 					# location of your symmetricDS install
export SYM_WORK_DIR=$(readlink -f $(dirname $SYM_DEMO_DIR)/work/)   	# your working directory, to be created
export SYM_CORP_IP=$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')

# A file that needs fixing in the symmetric bin directory
# -------------------------------------------------------------
export SYM_GOOD_SETENV=$SYM_DEMO_DIR/fixed-sym-setenv
export SYM_BAD_SETENV=$SYM_INSTALL/bin/setenv
