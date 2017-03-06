#!/bin/bash
DEMO_DIR=$(readlink -f ../rundemo/)
. $DEMO_DIR/env.sh

DB=/tmp/client3.sqlite

# create and populate the client2 database
rm $DB
sqlite3 $DB < ../rundemo/testtables.sql

# add and populate the sym tables
$SYM_HOME/bin/symadmin --properties conf/emclient.properties create-sym-tables 
sqlite3 $DB < sym_setup_emclient.sql

