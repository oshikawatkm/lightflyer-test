#!/bin/bash

source ./manage_nodes.sh
source ./parse_yaml.sh


function all_address {
  echo ======= ADDRESS LIST  =======
  echo [
  get_all_nodename
  for NODE in ${NODE_ARRAY[@]}; do
    cd /Users/$(whoami)/lfc-workspace/$NODE
    get_all_port $NODE
    ADDRESS_STR=`lncli --rpcserver=localhost:$RPC_LISTEN --macaroonpath=/Users/$(whoami)/lfc-workspace/$NODE/data/chain/bitcoin/simnet/admin.macaroon newaddress np2wkh`
    ADDRESS=`echo $ADDRESS_STR | sed -e "s/^.\{14\}//" -e "s/.\{3\}$//"`
    echo $NODE $ADDRESS
  done
  echo ]
}
all_address