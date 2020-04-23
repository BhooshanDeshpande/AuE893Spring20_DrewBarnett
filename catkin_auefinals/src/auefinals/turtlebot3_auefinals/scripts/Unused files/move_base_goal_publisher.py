#!/usr/bin/env python
import rospy
from geometry_msgs.msg import PoseStamped
import time

def publish():
    goal = PoseStamped()
    goal.header.frame_id = "map"
    goal.header.stamp = rospy.Time.now()
    goal.pose.position.x = -0.116210371256
    goal.pose.position.y = 3.3141617775
    goal.pose.orientation.z = 0.999
    goal_pub = rospy.Publisher('/move_base_simple/goal',PoseStamped,queue_size=10,latch=True)
    goal_pub.publish(goal)

if __name__ == '__main__':
    print('Starting main script...')
    rospy.init_node('move_base_publisher',anonymous=True) 
    try:
        publish()   
        time.sleep(2)
    except rospy.ROSInterruptException:
        pass
        