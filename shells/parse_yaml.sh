#!/bin/bash

function get_all_nodename {
  All_NODES=`grep name: /Users/oshikawa/Desktop/light-flyer/networkSettings/defaultNetwork.yaml | awk '/name:/ { print $NF }'`
  NODE_ARRAY=(`echo $All_NODES`)
}

function get_rpclisten () {
  RPC_LISTEN=`grep -A2 $1: /Users/oshikawa/Desktop/light-flyer/networkSettings/defaultNetwork.yaml | tail -n1 | awk '{ print $2}'`
}

function get_listen () {
  LISTEN=`grep -A3 $1: /Users/oshikawa/Desktop/light-flyer/networkSettings/defaultNetwork.yaml | tail -n1 | awk '{ print $2}'`
}

function get_restlisten () {
  REST_LISTEN=`grep -A4 $1: /Users/oshikawa/Desktop/light-flyer/networkSettings/defaultNetwork.yaml | tail -n1 | awk '{ print $2}'`
}

get_all_port () {
  RPC_LISTEN=`grep -A2 $1: /Users/oshikawa/Desktop/light-flyer/networkSettings/defaultNetwork.yaml | tail -n1 | awk '{ print $2}'`
  LISTEN=`grep -A3 $1: /Users/oshikawa/Desktop/light-flyer/networkSettings/defaultNetwork.yaml | tail -n1 | awk '{ print $2}'`
  REST_LISTEN=`grep -A4 $1: /Users/oshikawa/Desktop/light-flyer/networkSettings/defaultNetwork.yaml | tail -n1 | awk '{ print $2}'`
}  
#get_rpclisten alice
# get_listen alice
# get_restlisten alice
# echo $RPC_LISTEN