FROM ubuntu

RUN \
  apt-get update && \
  apt-get install -y software-properties-common && \
  add-apt-repository -y ppa:ethereum/ethereum && \
  apt-get update && \
  apt-get install -y ethereum net-tools

ENV nodekeyhex=""
CMD exec bootnode -nodekeyhex $nodekeyhex
