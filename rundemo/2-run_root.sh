#!/bin/bash
DEMO_DIR=$(dirname $(readlink -f $0))
. $DEMO_DIR/env.sh

# Run the root node and allow registration
$SYM_HOME/bin/sym --properties $WORK_DIR/corp-000.properties --port 8090 2> $WORK_DIR/output/rootrun.log &

# Open registration
$SYM_HOME/bin/symadmin --properties $WORK_DIR/corp-000.properties open-registration store android-003

# Give the user something to work with
echo ""
echo Here are some useful commands:
echo -------------------------------------------------------------------------
echo . $DEMO_DIR/env.sh
echo tail -f $WORK_DIR/output/rootrun.log
