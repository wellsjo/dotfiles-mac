#!/bin/bash

docker_rm_containers() {
  sudo docker rm -f $(sudo docker ps -a -q)
}

docker_rm_images() {
  sudo docker rmi -f $(sudo docker images -q)
}
