#!/usr/bin/fish

set CPU  1
set DISK 10000
set RAM  1024

docker-machine create \
    --driver virtualbox \
    --swarm \
    --swarm-experimental \
    --swarm-master \
    --virtualbox-cpu-count $CPU \
    --virtualbox-disk-size $DISK \
    --virtualbox-memory $RAM \
master

docker-machine create \
    --driver virtualbox \
    --swarm \
    --swarm-experimental \
    --virtualbox-cpu-count $CPU \
    --virtualbox-disk-size $DISK \
    --virtualbox-memory $RAM \
slave.one

docker-machine create \
    --driver virtualbox \
    --swarm \
    --swarm-experimental \
    --virtualbox-cpu-count $CPU \
    --virtualbox-disk-size $DISK \
    --virtualbox-memory $RAM \
slave.two

docker-machine ls

