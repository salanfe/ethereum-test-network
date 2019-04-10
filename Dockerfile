FROM ethereum/client-go

# keystore generated with "$ geth account init"
ADD ./keystore ./keystore 
# genesis file generated with "$ puppeth"
ADD ./genesis.json ./genesis.json
RUN geth --datadir . init genesis.json

ENTRYPOINT \
printf '%s\t%s\t%43s\n' "" "sealing address" "private key" && \
printf '%s\t%s\t%s\n' "1" "0x500a072dfa63f6df33a7e3c3a1bac649fc8ffee9" "0x30651a022e175fa0e765ddbe31b55706ce117774e8e873e8cd547647aa966587" && \
printf '%s\t%s\t%35s\n' "" "development address" "private key" && \
printf '%s\t%s\t%s\n' "1" "0x362bfe247396ecc09d30091e3c5ca2d5f527bd06" "0xf1602f6e85c026028f9a7c67012cc7dbbade2cbf34447ca66f9196b0ebb0dc6f" && \
printf '%s\t%s\t%s\n' "2" "0xca1c753ed477ac905f4ec6c9851bc81f0fb41512" "0xaf304322d63ee810ced35c603a98b38fbe2414e7ab4ba9438fef9aed340e7d1c" && \
printf '%s\t%s\t%s\n' "3" "0x61cfb9bc71d6f2747598db3f767b4b8967f029ab" "0xb0386e69d886de4f3d3fdef43e783c746ac995d56a4199cc3002eb5b512dc3f7" && \
printf '%s\t%s\t%s\n' "4" "0x5b8398f4ab4dd5d9a622ee7ce5fe780cb32924f8" "0x34a887d54c67f152a4d2262c0242b6fe1f259f40d3eaa36f6c784357f56d4491" && \
printf '%s\t%s\t%s\n' "5" "0x7c84dc0a6edd6a0b4380ed3a4c9df461a83a35ea" "0xebbe5fcac38426d9d94476446cc12ca0f6499699a37a7dfb49bffb3fafb81d2e" && \
printf '%s\t%s\t%s\n' "6" "0x1894a99532fbd03ed5acada241a889870af0731c" "0x88a7c0d55630046bb128f8843ca842f250f344543c00fc78559909a2f89cff59" && \
printf '%s\t%s\t%s\n' "7" "0x9286f33c4567e4433db41185d0a72f990cc6cfb0" "0xfe83a7135229dedc572316b84a09f4fbca4793d4121c3d42ccf725c44769c4e5" && \
printf '%s\t%s\t%s\n' "8" "0x2add9c0db0e2a69df11b6164949078bbcfb4bbab" "0x8aef869d6498858917ff723812801ea7d928ea153a4a8ff26ff2ca2d843403dd" && \
printf '%s\t%s\t%s\n' "9" "0xb9590e210ecbcb4a61cca006b2aed5343fd78662" "0x10672a664e2d7527a56e10758f144dc8c2f7c34c8ef836e9ef7d0c9c8eedbd44" && \
printf '%s\t%s\t%s\n' "10" "0x3724809bff55562a3d28fcd4e3f98198f1cdc0f0" "0x4a252160538248f3224d8d4377c01209d6220e63f800a0316997933706742849" && \
geth --datadir . \
--rpc --rpcapi "admin,db,debug,eth,miner,net,personal,shh,txpool,web3" --rpcvhosts "*" --rpccorsdomain "*" \
--ws --wsapi "admin,db,debug,eth,miner,net,personal,shh,txpool,web3" --wsorigins "*" \
--mine --unlock 0x500a072dfa63f6df33a7e3c3a1bac649fc8ffee9 --password keystore/password.txt --allow-insecure-unlock \
--gcmode archive

# expose rpc port
EXPOSE 8545

# expose websocket port
EXPOSE 8546