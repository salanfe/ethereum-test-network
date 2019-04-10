FROM ethereum/client-go

# keystore generated with "$ geth account init"
ADD ./keystore ./keystore 
# genesis file generated with "$ puppeth"
ADD ./genesis.json ./genesis.json
RUN geth --datadir . init genesis.json

ENTRYPOINT geth --datadir . \
--rpc --rpcapi "admin,db,debug,eth,miner,net,personal,shh,txpool,web3" --rpcvhosts "*" --rpccorsdomain "*" \
--ws --wsapi "admin,db,debug,eth,miner,net,personal,shh,txpool,web3" --wsorigins "*" \
--mine --unlock 0x500a072dfa63f6df33a7e3c3a1bac649fc8ffee9 --password keystore/password.txt --allow-insecure-unlock \
--gcmode archive

# expose rpc port
EXPOSE 8545

# expose websocket port
EXPOSE 8546