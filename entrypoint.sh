#!/bin/bash

# ulimit -n 102400
# ulimit -c 1073741824

DATADIR="/var/lib/proxysql"

echo -n "Starting ProxySQL: "
      mkdir $DATADIR 2>/dev/null

OPTS="-c /etc/proxysql.cnf -D $DATADIR"
OPTS="--initial -f $OPTS"
proxysql $OPTS

exec $@
