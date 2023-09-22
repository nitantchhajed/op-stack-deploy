
# Deploy Existing sequencer node with Docker

This tutorial explains the step-by step procedure to deploy the Existing sequencer node of op-stack chain using Docker.



## Requirements
Make sure you have the following files -

- Make sure you are doing it in the same system/server which have sequencer node running.
- genesis.json
- rollup.json
- op-geth initialized with the genesis file 
- jwt.txt
- All the private keys - Admin, Batcher, Proposer, sequencer
- All the L1 contracts deployed.




## Deployment steps


pull the docker image of `op-geth`

```bash
  docker pull us-docker.pkg.dev/oplabs-tools-artifacts/images/op-geth:v1.101200.0
```

create docker images of `op-node` locally

```bash
  cd optimism

  docker build -t op-node:1 -f op-node/Dockerfile .
```

create image of `op-batcher` locally 

```bash
  cd optimism

  docker build -t op-batcher:1 -f op-batcher/Dockerfile .
```

create image of `op-proposer` locally 

```bash
  cd optimism

  docker build -t op-proposer:1 -f op-proposer/Dockerfile .
```

stop all the services `op-proposer` `op-bacher` `op-node` `op-geth` by the help of this documentation - https://stack.optimism.io/docs/build/operations/#
## Run 
- download the docker-compose file to your system

- edit the file according to your chain configuration

```bash
  docker compose up -d 
```

you will see the containers starting

```bash
  docker ps 
```
to see the logs of the containers

```bash
  docker logs <CONTAINER_ID> 
```
You will see the blocks will continue from the last block made.