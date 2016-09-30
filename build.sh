#! /bin/sh

cd $(dirname $0)

IMG_NAME="$(basename $(pwd))"

sudo docker rm -f $IMG_NAME
sudo docker rmi -f alpined/$IMG_NAME
sudo docker build --no-cache -t alpined/$IMG_NAME .
