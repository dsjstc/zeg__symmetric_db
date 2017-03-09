#!/bin/bash
SYM_DEMO_DIR=$(dirname $(readlink -f $0))
. $SYM_DEMO_DIR/env.sh
cd $SYM_WORK_DIR

# Set up the root node
# create empty database with test tables
sqlite3 root.sqlite < $SYM_DEMO_DIR/testtables.sql
# add all the extra symmetricDS tables.
$SYM_INSTALL/bin/symadmin --properties ./corp-000.properties create-sym-tables 
# add test data and symmetricDS configuration
sqlite3 root.sqlite < $SYM_DEMO_DIR/sample_data.sql
sqlite3 root.sqlite < $SYM_DEMO_DIR/sym_setup_root.sql

# Now set up a client node
# create client database with (empty) test tables
sqlite3 client1.sqlite < $SYM_DEMO_DIR/testtables.sql
