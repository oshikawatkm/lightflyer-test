
source ./parse_yaml.sh

# start btcd test network
function start_btcd {
  nohup btcd --txindex --simnet --rpcuser=kek --rpcpass=kek >/dev/null 2>&1 &
  echo "===> Btcd Test Network Has Started ==="
}

function stop_btcd {
  ps aux | grep "btcd --txindex --simnet --rpcuser=kek --rpcpass=kek" |grep -v grep | awk '{ print "kill -9", $2 }' | sh
}

function start_mining () {
  stop_btcd
	echo "===> Mining Start ==="
  nohup btcd --simnet --txindex --rpcuser=kek --rpcpass=kek --miningaddr=$1 >/dev/null 2>&1 &
  btcctl --simnet --rpcuser=kek --rpcpass=kek generate 10
}

function start_lndnode () {
  cd /Users/$(whoami)/lfc-workspace/$1
	echo "===> Lnd Node Has Started ==="
  get_all_port $1
  lnd --rpclisten=localhost:$RPC_LISTEN --listen=localhost:$LISTEN --restlisten=localhost:$REST_LISTEN --datadir=data --logdir=log --debuglevel=info --bitcoin.simnet --bitcoin.active --bitcoin.node=btcd --btcd.rpcuser=kek --btcd.rpcpass=kek >/dev/null 2>&1 &
  sleep 5
}

function create_lnwallet() {
	echo "===> Create Lnd Wallet ==="
	expect -c "
		spawn lncli --rpcserver=localhost:$RPC_LISTEN --macaroonpath=./data/chain/bitcoin/simnet/admin.macaroon create	
		expect \"Input wallet password:\"
		send -- \"password\n\"
		expect \"Confirm password:\"
		send -- \"password\n\"
		expect \"Do you have an existing cipher seed mnemonic you want to use? (Enter y/n):\"
		send -- \"n\n\"
		expect \"Your cipher seed can optionally be encrypted.\"
		expect \"Input your passphrase if you wish to encrypt it (or press enter to proceed without a cipher seed passphrase): \"
		send -- \"\n\"
		expect \"Generating fresh cipher seed...\"
		expect \"!!!YOU MUST WRITE DOWN THIS SEED TO BE ABLE TO RESTORE THE WALLET!!!

			---------------BEGIN LND CIPHER SEED---------------\
			1. absent   2. wait     3. repeat    4. pelican\
			5. sad      6. dish     7. film      8. program\
			9. panel   10. ramp    11. devote   12. brain  \
			13. demand  14. direct  15. news     16. grant  \
			17. clock   18. health  19. actor    20. thunder\
			21. awake   22. legal   23. crystal  24. control\
			---------------END LND CIPHER SEED-----------------\
			
			!!!YOU MUST WRITE DOWN THIS SEED TO BE ABLE TO RESTORE THE WALLET!!!\

			lnd successfully initialized!\"
		send -- \"exit\n\"
		"
}


function get_address_node {
  ADDRESS_STR=`lncli --rpcserver=localhost:$RPC_LISTEN --macaroonpath=/Users/$(whoami)/lfc-workspace/alice/data/chain/bitcoin/simnet/admin.macaroon newaddress np2wkh`
  ADDRESS=`echo $ADDRESS_STR | sed -e "s/^.\{14\}//" -e "s/.\{3\}$//"`
}


function mkworkspace {
  cd ~
	if [ ! -e lfc-workspace ]; then
		mkdir lfc-workspace
	fi
}

function add_user() {
  pwd
  NAME=$1
  echo "$NAME"
  if [ ! -d "$NAME" ]; then
		mkdir "$NAME"
	fi
}