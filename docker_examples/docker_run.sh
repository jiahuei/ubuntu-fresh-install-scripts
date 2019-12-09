#!/usr/bin/env bash


#    -p 6006:6006 \

DOC_DIR="/home/jiahuei/Documents"

docker run -it \
    --gpus all \
    -v ${DOC_DIR}/3_Datasets/MSCOCO_captions:/master/datasets/mscoco \
    -v ${DOC_DIR}/3_Datasets/InstaPIC1M:/master/datasets/insta \
    -u "$(id -u)":"$(id -g)" \
    -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY \
    --rm jiahuei/tensorflow:1.9.0-gpu

