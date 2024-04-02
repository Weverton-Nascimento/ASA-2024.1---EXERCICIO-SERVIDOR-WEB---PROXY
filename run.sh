#!/bin/bash

#build
docker build -t c01 ./c01
docker build -t c02 ./c02
docker build -t c03 ./c03
docker build -t proxy ./proxy

#run
docker network create -d bridge asa-net
docker run -d --net=asa-net --name c01 c01
docker run -d --net=asa-net --name c02 c02
docker run -d --net=asa-net --name c03 c03
docker run -dp 8000:80 --net=asa-net --name proxy proxy
