#! /usr/bin/env python

import rospy
import math
from std_msgs.msg import String
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist
PI = 3.1415926535897

def callback(data): 
    # left_sweep = data.ranges[0:45]
    # right_sweep = data.ranges[314:359]      
    # total_sweep = left_sweep + right_sweep
    # middle_reading = total_sweep[0:10]+total_sweep[349:359]
    left_center = data.ranges[45:105]
    right_center = data.ranges[300:355]
    avgr = sum(right_center)/len(right_center)
    avgl = sum(left_center)/len(left_center)

    # print('right', avgr)
    # print('left', avgl)
    total_distance = 0.7

    error = total_distance - avgr
    kp = 2.3
    
    if error > 0.05 or error < -0.05:

        velocity_msg.linear.x = 0.4
        velocity_msg.angular.z = kp*error
    else:
        velocity_msg.angular.z  = 0
        velocity_msg.linear.x = 0.7


rospy.init_node('turtle_control', anonymous=True)
velocity_msg=Twist()
pub = rospy.Publisher('cmd_vel', Twist, queue_size= 10)
sub = rospy.Subscriber('scan', LaserScan,callback)
rate = rospy.Rate(15)

while not rospy.is_shutdown():
    pub.publish(velocity_msg)
    rate.sleep()
