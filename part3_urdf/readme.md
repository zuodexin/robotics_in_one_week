# 文件结构
```xml
<robot name="my_robot">
  <link name="base_link">
    <visual>
      <geometry><box size="0.1 0.2 0.3"/></geometry>
    </visual>
  </link>
  <link name="arm_link"/>
  <joint name="base_to_arm" type="fixed">
    <parent link="base_link"/>
    <child link="arm_link"/>
  </joint>
</robot>
```

# 语法规则

## 宏
Xacro宏扩展，使用xacro简化复杂URDF（变量、循环、宏）：

```xml
<xacro:macro name="default_link" params="name">
  <link name="${name}">
    <visual><geometry><sphere radius="0.1"/></geometry></visual>
  </link>
</xacro:macro>
<xacro:default_link name="test"/>
```

# 工具
## 验证

### check_urdf命令
```
sudo apt install liburdfdom-tools
check_urdf my_robot.urdf

```

# 可视化

## 安装Rviz
如果你用的不是 ros-noetic-desktop-full 镜像，容器里可能没有 rviz，你可以在容器里运行：
```bash
apt update
apt install ros-noetic-rviz
```

```
## 将 URDF 加载到 ROS 参数服务器

在 RViz 中：
添加一个 RobotModel 组件。
设置 Robot Description 为你的 URDF 文件（通常是发布在 /robot_description 的 rosparam）。
例如，如果你有一个 URDF 文件 my_robot.urdf，你可以先用以下命令发布它
```bash
rosparam set /robot_description -t my_robot.urdf
```
- /robot_description 是 RViz 默认读取的参数名称。
- -t 是 rosparam 读入 XML 文件的方式。
- 如果你是用 .xacro 文件，请先转成 .urdf：
```bash
rosrun xacro xacro -o my_robot.urdf my_robot.xacro
```
## 启动
进入容器后，运行如下命令：
```bash
roscore
```
打开一个 新的终端（或在容器中再开一个 shell），然后运行：
```bash
docker exec -it ros-noetic-container bash

rviz
```

完整流程命令示例
```bash
# 1. 启动 roscore
roscore

# 2. 新终端，加载 URDF
rosparam set /robot_description -t ~/catkin_ws/src/my_robot_description/urdf/my_robot.urdf

# 3. 再开一个终端，启动 RViz
rviz
```

## 在 RViz 中添加并配置模型
点击左下角 “Add”。

选择 “RobotModel”。

添加后，它会尝试从 /robot_description 获取 URDF。

设置 Fixed Frame（通常设为 base_link 或 URDF 中的根链接名）。

你应该能看到你的机器人模型。

