#!/bin/bash
SYM_DEMO_DIR=$(dirname $(readlink -f $0))
. $SYM_DEMO_DIR/env.sh

# Run the client node
$SYM_INSTALL/bin/sym --properties $SYM_WORK_DIR/store-001.properties --port 31516 2> $SYM_WORK_DIR/output/clientrun.log &
