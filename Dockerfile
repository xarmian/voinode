FROM algorand/algod:latest

ENV NETWORK=voimain-v1.0 FAST_CATCHUP=1

COPY ./config.json /etc/algorand/config.json
COPY ./genesis-voi-mainnet.json /node/run/genesis/voimain-v1.0/genesis.json
COPY ./genesis-voi-testnet.json /node/run/genesis/voitest-v1.0/genesis.json

RUN apt-get update && apt-get -y install jq
