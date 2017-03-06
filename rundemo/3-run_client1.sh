#!/bin/bash
DEMO_DIR=$(dirname $(readlink -f $0))
. $DEMO_DIR/env.sh

# Run the client node
$SYM_HOME/bin/sym --properties $WORK_DIR/store-001.properties --port 31516 2> $WORK_DIR/output/clientrun.log &
