FROM ros:noetic

# 设置时区（可选）
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y tzdata && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

# 安装常用工具（包括 RViz）
RUN apt update && apt install -y \
    ros-noetic-rviz \
    ros-noetic-xacro \
    ros-noetic-joint-state-publisher \
    ros-noetic-robot-state-publisher \
    ros-noetic-tf \
    ros-noetic-tf2-ros \
    ros-noetic-urdf \
    ros-noetic-urdf-parser-plugin \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# 设置环境变量
ENV DISPLAY=:0
ENV QT_X11_NO_MITSHM=1

# 创建工作空间目录
RUN mkdir -p /root/catkin_ws/src
WORKDIR /root/catkin_ws