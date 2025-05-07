#!/usr/bin/env python

import rospy
from std_msgs.msg import String


def talker():
    # 初始化节点
    rospy.init_node("talker", anonymous=True)

    # 创建发布者，发布到话题 'chatter'
    pub = rospy.Publisher("chatter", String, queue_size=10)

    # 设置发布频率（10 Hz）
    rate = rospy.Rate(10)

    while not rospy.is_shutdown():
        # 发布消息
        hello_str = "Hello, ROS!"
        rospy.loginfo(hello_str)
        pub.publish(hello_str)

        # 按照频率发布消息
        rate.sleep()


if __name__ == "__main__":
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
