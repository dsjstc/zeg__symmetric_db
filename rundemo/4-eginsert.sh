#!/bin/bash
DEMO_DIR=$(dirname $(readlink -f $0))
. $DEMO_DIR/env.sh
cd $WORK_DIR

# Insert an item row with an ID consisting of a random word.
DB=root.sqlite
if [ "$1" != "" ]; then
	DB=$1.sqlite
fi

PROD=`shuf -n1  /usr/share/dict/words | tr -d \' `
ROWID=`cat << EOF | sqlite3 $DB
insert into item ( item_id, name ) values ( NULL, '$PROD' );
select last_insert_rowid();
EOF`

echo 'echo "select * from item where item_id='$ROWID';" | sqlite3 ' $DB

