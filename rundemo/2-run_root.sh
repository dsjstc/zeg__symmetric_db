#!/bin/bash
SYM_DEMO_DIR=$(dirname $(readlink -f $0))
. $SYM_DEMO_DIR/env.sh

# Run the root node and allow registration
$SYM_INSTALL/bin/sym --properties $SYM_WORK_DIR/corp-000.properties --port 8090 2> $SYM_WORK_DIR/output/rootrun.log &

# Open registration
$SYM_INSTALL/bin/symadmin --properties $SYM_WORK_DIR/corp-000.properties open-registration store android-003

# Give the user something to work with
echo ""
echo Here are some useful commands:
echo -------------------------------------------------------------------------
echo . $SYM_DEMO_DIR/env.sh
echo tail -n 200 -f $SYM_WORK_DIR/output/rootrun.log | grep -v DataGapFastDetector
