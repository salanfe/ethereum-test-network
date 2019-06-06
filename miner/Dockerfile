ARG tag_version
FROM ethereum/client-go:${tag_version}

ARG password
ARG privatekey
RUN echo $password > /account.password
RUN echo $privatekey > /private.key
ADD ./genesis.json /genesis.json
RUN geth init genesis.json
RUN geth account import --password /account.password  /private.key

ENV address=""
ENV bootnodeId=""
ENV bootnodeIp=""
ENV nodeName=""
ENV ethstatsIp=""
ENV ethstatsSecret=""

ENTRYPOINT geth \
--identity $nodeName \
--networkid 6464 \
--ipcpath /tmp/${nodeName}.ipc \
--rpc --rpcaddr "0.0.0.0" --rpcapi "admin,db,debug,eth,miner,net,personal,shh,txpool,web3,clique" --rpcvhosts "*" --rpccorsdomain "*" \
--ws --wsaddr "0.0.0.0" --wsapi "admin,db,debug,eth,miner,net,personal,shh,txpool,web3,clique" --wsorigins "*" \
--bootnodes "enode://$bootnodeId@$bootnodeIp:30301" \
--syncmode full --gcmode archive --gasprice "0" \
--etherbase $address --unlock $address --password /account.password --mine \
--ethstats "$nodeName:$ethstatsSecret@$ethstatsIp:3000"
