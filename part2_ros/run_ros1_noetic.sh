#!/bin/bash

CONTAINER_NAME=ros1_noetic
WORKSPACE_DIR=`pwd`

# 启动 Docker 容器
docker run -it --rm \
    --name $CONTAINER_NAME \
    --network host \
    --env DISPLAY=$DISPLAY \
    --env QT_X11_NO_MITSHM=1 \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="$WORKSPACE_DIR:${WORKSPACE_DIR}" \
    --env="XAUTHORITY=$XAUTH" \
    ros:noetic \
    bash -c "source /opt/ros/noetic/setup.bash && cd ${WORKSPACE_DIR} && bash"
