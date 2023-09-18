This docker image modifies the official algod docker container found at https://hub.docker.com/r/algorand/algod to be used for the Voi TestNet Network. It makes the following changes to the official image:

1. It sets the default network to voitest-v1 and enables Fast Catchup
2. It updates the config.json by setting GossipFanout, DNSBootstrapID, and EnableCatchupFromArchiveServers
2. It updates the genesis.json file to the Voi TestNet Network's Genesis file

All environment variable options for the Algorand official docker container are available in this image.

Currently only the `algorand/algod:latest` branch is available using this image.

A node can be launched using the following docker command:

```docker run --rm -it -v ${PWD}/data:/algod/data --name my_voi_node xarmian/voinode```

This command will create a Voi network node container named `my_voi_node` and map the node's data directory to a folder named "data" inside the user's current working directory.

NOTICE: This image is supplied without warranty.
