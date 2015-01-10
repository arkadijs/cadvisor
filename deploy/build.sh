#!/bin/sh -xe

v=2
godep go build -a github.com/google/cadvisor
strip cadvisor
docker build -t google/cadvisor:$v .
t=docker-registry.r53.acp.io:5000/google/cadvisor:$v
docker tag -f google/cadvisor:$v $t
docker push $t
