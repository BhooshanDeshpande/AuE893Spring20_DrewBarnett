#!/usr/bin/env python
import rospy
import roslaunch
from std_msgs.msg import Int32

tag = 2

def callback():
    global tag
    tag  = data.data

def launch():
    global tag 
    uuid = roslaunch.rlutil.get_or_generate_uuid(None, False)
    roslaunch.configure_logging(uuid)
    launch = roslaunch.parent.ROSLaunchParent(uuid, ["/home/bhooshan/Desktop/Bhooshan-ubuntu/udemy_ws/src/auefinals/line_follower_turtlebot/launch/auefinals.launch"])
    if tag == 2:
        launch.start()
        rospy.loginfo("LineFollower Source Code Started")
    else: 
        launch.shutdown()

def listen():   
    rospy.init_node('tag_listener',anonymous=True)
    rospy.Subscriber('tag_publisher',Int32,tag_callback)
    rospy.spin() 

if __name__ == '__main__':
    print('Starting main script...') 
    while tag != 2:
        listen()
    else:
        rospy.init_node('LineFollowing', anonymous=True)
        launch() 
        