FROM algorand/algod:latest

ENV NETWORK=voitest-v1 FAST_CATCHUP=1

COPY ./config.json /etc/algorand/config.json
COPY ./genesis.json /node/run/genesis/voitest-v1/genesis.json

RUN apt-get update && apt-get -y install jq
