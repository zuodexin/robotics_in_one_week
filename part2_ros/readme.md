# 步骤 1：创建一个 ROS 包
```bash
cd ~/catkin_ws/src
catkin_create_pkg my_first_package std_msgs rospy
```
- my_first_package：包的名字

- std_msgs：你会用到的标准消息类型

- rospy：用于编写 Python 节点的 ROS 客户端库

# 步骤 2：编写一个发布节点
在 my_first_package 目录下创建一个 scripts 文件夹，并在其中创建一个 Python 文件 talker.py，代码如下：

```python
#!/usr/bin/env python3

import rospy
from std_msgs.msg import String

def talker():
    # 初始化节点
    rospy.init_node('talker', anonymous=True)
    
    # 创建发布者，发布到话题 'chatter'
    pub = rospy.Publisher('chatter', String, queue_size=10)
    
    # 设置发布频率（10 Hz）
    rate = rospy.Rate(10)
    
    while not rospy.is_shutdown():
        # 发布消息
        hello_str = "Hello, ROS!"
        rospy.loginfo(hello_str)
        pub.publish(hello_str)
        
        # 按照频率发布消息
        rate.sleep()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass

```

# 步骤 3：给 Python 脚本加可执行权限

```bash
chmod +x ~/catkin_ws/src/my_first_package/scripts/talker.py
```

# 步骤 4：编译并启动 ROS 工作空间
在 catkin_ws 根目录下(该目录必须包含一个src目录，可以为空)编译工作空间：
```bash
cd ~/catkin_ws
catkin_make
source devel/setup.bash
```


# 步骤 5：运行节点
你现在可以运行你的 ROS 节点了。首先启动 roscore：
```bash
roscore
```
然后运行你的 talker 节点：

```bash
rosrun my_first_package talker.py
```

# 步骤 6：查看发布的消息
你可以通过 rostopic echo 查看发布的消息：
```bash
rostopic echo /chatter
```
这会显示你发布的消息 "Hello, ROS!"，并且每秒更新一次（由于发布频率是 10 Hz）。

# 小结
你创建了一个 ROS 节点，它向 chatter 话题发布消息。

使用 rostopic echo 查看该消息。

通过 rospy 和标准的消息类型，你可以很方便地编写自己的 ROS 节点。