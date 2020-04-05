#!/bin/bash

source ./manage_nodes.sh
source ./parse_yaml.sh



function all_walletbalance {
  echo ======= WALLET BALLANCE LIST  =======
  echo [
  get_all_nodename
  for NODE in ${NODE_ARRAY[@]}; do
    cd /Users/$(whoami)/lfc-workspace/$NODE
    get_all_port $NODE
    BALANCE_STR=`lncli --rpcserver=localhost:$RPC_LISTEN --macaroonpath=/Users/$(whoami)/lfc-workspace/$NODE/data/chain/bitcoin/simnet/admin.macaroon walletbalance`
    BALANCE=`echo $BALANCE_STR | sed -e "s/^.\{14\}//" -e "s/.\{3\}$//"`
    echo $NODE $BALANCE_STR
  done
  echo ]
}
all_walletbalance

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
  wait $!
  echo ]
}
all_address