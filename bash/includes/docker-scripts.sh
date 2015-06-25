#!/bin/bash

docker_rm_containers() {
  sudo docker rm $(sudo docker ps -a -q)
}

docker_rm_images() {
  sudo docker rmi $(sudo docker images -q)
}
