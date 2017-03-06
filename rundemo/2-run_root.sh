#!/bin/bash
DEMO_DIR=$(dirname $(readlink -f $0))
. $DEMO_DIR/env.sh

# Run the root node and allow registration
$SYM_HOME/bin/sym --properties $WORK_DIR/corp-000.properties 2> $WORK_DIR/output/rootrun.log &

# Open registration
$SYM_HOME/bin/symadmin --properties $WORK_DIR/corp-000.properties open-registration store 004
