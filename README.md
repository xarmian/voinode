# Voi Testnet Node #

This docker image modifies the official algod docker container found at https://hub.docker.com/r/algorand/algod to be used for the Voi TestNet Network. It makes the following changes to the official image:

1. It sets the default network to voitest-v1 and enables Fast Catchup
2. It updates the config.json by setting GossipFanout, DNSBootstrapID, and EnableCatchupFromArchiveServers
3. It updates the genesis.json file to the Voi TestNet Network's Genesis file
4. Installs `jq` package to make bringing your account online a bit easier

All environment variable options for the Algorand official docker container are available in this image.

Currently only the `algorand/algod:latest` branch is available using this image.

# Getting Started #

A node container can be launched using the following docker command:

```docker run --rm -it -v ${PWD}/data:/algod/data --name my_voi_node xarmian/voinode```

This command will create a Voi network node container named `my_voi_node` and map the node's data directory to a folder named "data" inside the user's current working directory.

NOTE: The container's log will be output to the terminal, the container will be removed when stopped, and it will not resume on restart. Therefore it is not feasible to operate a production node using this command (see `Putting it all together` section below)

# Adding Telemetry #

To enable Telemetry reporting, add the environment variable TELEMETRY_NAME, i.e.:

```docker run --rm -it -v ${PWD}/data:/algod/data -e TELEMETRY_NAME=my_voi_node --name my_voi_node xarmian/voinode```

# Putting it all together #

To make the container more resilient, launch the container using the parameter `--restart=unless-stopped` and use the `-d` flag as follows:
```
docker run -d \
    --name my_voi_node \
    --restart=unless-stopped -d \
    -e TELEMETRY_NAME=my_voi_node \
    -v ${PWD}/data:/algod/data \
    xarmian/voinode
```
This will launch your telemetry-enabled container in the background and automatically restart the container if it is stopped. Replace `my_voi_node` in the `--name` parameter to give your container a name you will recognize, and in the `-e TELEMETRY_NAME=` environment variable to report a specific name to the telemetry aggregator.

# Interacting with algod #
Use the following command to launch an interactive CLI session. This will allow you to execute commands such as `goal`. Replace `my_voi_node` with the name of your container:
```docker exec -it my_voi_node bash```

# Consensus Participation #
To use your node for consensus participation, launch into the Interactive shell (described in the section above) and follow the guide located in the `Participation` section at the following URL: https://d13.co/posts/set-up-voi-participation-node/#participation

For more information on the configuration options available, please see the official Algorand node documentation here: https://hub.docker.com/r/algorand/algod

NOTICE: This image is supplied without warranty.
