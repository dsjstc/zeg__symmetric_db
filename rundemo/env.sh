#!/bin/bash
export DEMO_DIR=$(dirname $(readlink -f $0))
export SYM_HOME=/opt/symmetric-server-3.8.16/
export WORK_DIR=$(dirname $DEMO_DIR)/work/

export GOODSE=$DEMO_DIR/fixed-sym-setenv
export BADSE=$SYM_HOME/bin/setenv
