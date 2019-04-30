FROM ethereum/client-go

ARG password
ARG privatekey
RUN echo $password > ~/.accountpassword
RUN echo $privatekey > ~/.privatekey
ADD ./genesis.json ./genesis.json
RUN geth init genesis.json
RUN geth account import --password ~/.accountpassword  ~/.privatekey

ENV address=""
ENV bootnodeId=""
ENV bootnodeIp=""
ENV nodeName=""
ENV ethstatsIp=""
ENV ethstatsSecret=""

ENTRYPOINT geth \
--identity $nodeName \
--rpc --rpcaddr "0.0.0.0" --rpcapi "admin,db,debug,eth,miner,net,personal,shh,txpool,web3" --rpcvhosts "*" --rpccorsdomain "*" \
--ws --wsaddr "0.0.0.0" --wsapi "admin,db,debug,eth,miner,net,personal,shh,txpool,web3" --wsorigins "*" \
--bootnodes "enode://$bootnodeId@$bootnodeIp:30301" \
--syncmode=full --gcmode archive --gasprice "0" \
--etherbase $address --unlock $address --password ~/.accountpassword --mine --allow-insecure-unlock \
--ethstats "$nodeName:$ethstatsSecret@$ethstatsIp:3000"
