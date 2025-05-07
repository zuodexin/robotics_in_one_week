#!/bin/bash

CONTAINER_NAME=ros_noetic_rviz
WORKSPACE_DIR=~/catkin_ws

# 创建本地工作空间
mkdir -p $WORKSPACE_DIR/src

# 启用 X11 显示权限
xhost +local:docker

# 运行容器
docker run -it \
    --name $CONTAINER_NAME \
    --network host \
    --env DISPLAY=$DISPLAY \
    --env QT_X11_NO_MITSHM=1 \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="$WORKSPACE_DIR:/root/catkin_ws" \
    ros:noetic-rviz \
    bash -c "source /opt/ros/noetic/setup.bash && cd /root/catkin_ws && bash"