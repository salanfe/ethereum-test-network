# Ethereum-Geth Test Environment

Ethereum Development Network

## Docker

```shell
$ docker-compose up
```

to reset state

```sehll
$ docker-compose down
```

(https://stackoverflow.com/questions/32612650/how-to-get-docker-compose-to-always-re-create-containers-from-fresh-images)

### IPC

a volume is mapped to `/tmp` for geth IPCs:

* `/tmp/miner1.ipc`
* `/tmp/miner2.ipc`
* `/tmp/miner3.ipc`

docker writes in `/tmp` as root, which can cause troubles. To change owner:

```shell
$ sudo chown $USER:$USER /tmp/miner1.ipc /tmp/miner2.ipc /tmp/miner3.ipc
```

### geth version

Tag of geth version variable `GETH_TAG_VERSION` is defined in `.env`. Value can be overwritten by defining the variable when running docker, e.g.

```shell
$ GETH_TAG_VERSION=v1.8.25 docker-compose up --build
```

by default, `stable` is used.

## EthStats

Dashboard on `localhost:3000`

## Accounts

### sealing accounts

| account | address | private key |
| -|-|-|
| 1 | 0x4f1809cf76a8946d615cb546271cae3ea36328ed | 0xbe4b83a3bff4fd9ec8b060e68fab18a2c0f78ac3943865931dcb73e6303dc48c |
| 2 | 0x7d4684e8f1827832f13124b13874b00890a8a83f | 0x6342956d853c618c0c029fcb900c2b551e255c4e765a942b34880e4bedcfb188 |
| 3 | 0x6206d535d4af9bd3327167027dbb2fffa070fc68 | 0x24fb5370826be6a62e1ee2c9f2ea3ed25cb4ac47c1c2d647b2c788e6cafcf51a |

### development accounts

| account | address | private key |
|-|-|-|
| 1 | 0x362bfe247396ecc09d30091e3c5ca2d5f527bd06 | 0xf1602f6e85c026028f9a7c67012cc7dbbade2cbf34447ca66f9196b0ebb0dc6f |
| 2 | 0xca1c753ed477ac905f4ec6c9851bc81f0fb41512 | 0xaf304322d63ee810ced35c603a98b38fbe2414e7ab4ba9438fef9aed340e7d1c |
| 3 | 0x61cfb9bc71d6f2747598db3f767b4b8967f029ab | 0xb0386e69d886de4f3d3fdef43e783c746ac995d56a4199cc3002eb5b512dc3f7 |
| 4 | 0x5b8398f4ab4dd5d9a622ee7ce5fe780cb32924f8 | 0x34a887d54c67f152a4d2262c0242b6fe1f259f40d3eaa36f6c784357f56d4491 |
| 5 | 0x7c84dc0a6edd6a0b4380ed3a4c9df461a83a35ea | 0xebbe5fcac38426d9d94476446cc12ca0f6499699a37a7dfb49bffb3fafb81d2e |
| 6 | 0x1894a99532fbd03ed5acada241a889870af0731c | 0x88a7c0d55630046bb128f8843ca842f250f344543c00fc78559909a2f89cff59 |
| 7 | 0x9286f33c4567e4433db41185d0a72f990cc6cfb0 | 0xfe83a7135229dedc572316b84a09f4fbca4793d4121c3d42ccf725c44769c4e5 |
| 8 | 0x2add9c0db0e2a69df11b6164949078bbcfb4bbab | 0x8aef869d6498858917ff723812801ea7d928ea153a4a8ff26ff2ca2d843403dd |
| 9 | 0xb9590e210ecbcb4a61cca006b2aed5343fd78662 | 0x10672a664e2d7527a56e10758f144dc8c2f7c34c8ef836e9ef7d0c9c8eedbd44 |
| 10 | 0x3724809bff55562a3d28fcd4e3f98198f1cdc0f0 | 0x4a252160538248f3224d8d4377c01209d6220e63f800a0316997933706742849 |

## Nodes

| name | account | rpc port | ws port |
|-|-|-|-|
| miner1 | 0x4f1809cf76a8946d615cb546271cae3ea36328ed | 8501 | 8601 |
| miner2 | 0x7d4684e8f1827832f13124b13874b00890a8a83f | 8502 | 8602 |
| miner3 | 0x6206d535d4af9bd3327167027dbb2fffa070fc68 | 8503 | 8603 |

## Upgrading an exisiting network to Constantinople

context:
* https://blog.ethereum.org/2019/02/22/ethereum-constantinople-st-petersburg-upgrade-announcement/
* https://github.com/ethereum/go-ethereum/releases/tag/v1.8.22

pre-fork system:

before forking to constantinople, the config part of the genesis file should look something like this.

```json
"config": {
        "chainId": 6464,
        "homesteadBlock": 1,
        "eip150Block": 2,
        "eip150Hash": "0x0000000000000000000000000000000000000000000000000000000000000000",
        "eip155Block": 3,
        "eip158Block": 3,
        "byzantiumBlock": 4,
        "clique": {
            "period": 1,
            "epoch": 30000
        }
    }
```

and let's say the current blockchain height is 135'900 and we want to setup the fork at block 150'000.

for every geth client on the private network do the following steps:

1. stop your geth node
2. update geth to a version that supports constantinople (v1.8.22 or higher)
3. edit the genesis file with `"constantinopleBlock": 150000`
4. load the updated genesis file into geth with `$ geth init genesis.json`
5. restart your node

## credits:

* inspired by https://github.com/javahippie/geth-dev
