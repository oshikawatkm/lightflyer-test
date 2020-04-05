#!/bin/bash
source ./manage_nodes.sh
source ./parse_yaml.sh

# Set Up environment
mkworkspace
cd /Users/$(whoami)/lfc-workspace
rm -rf /Users/$(whoami)/lfc-workspace/*

# Start Btcd Node
start_btcd
get_all_nodename
for NODE in ${NODE_ARRAY[@]}; do
  cd /Users/$(whoami)/lfc-workspace
  echo "===> create $NODE dir"
  add_user $NODE
  start_lndnode $NODE
  cd /Users/$(whoami)/lfc-workspace/$NODE
  create_lnwallet
done 

for NODE in ${NODE_ARRAY[@]}; do
  get_all_port $NODE
  get_address_node
  echo $ADDRESS
  start_mining $ADDRESS
  sleep 3
done 

cd /Users/oshikawa/Desktop/light-flyer/shells