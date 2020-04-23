#! /usr/bin/env python

import rospy
from std_msgs.msg import String
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist
import numpy as np 
import math
import time

from nav_msgs.msg import Odometry

def divide(x,y):
    try:
        return x/y
    except ZeroDivisionError:
        return 1000

def callback(data):
    left_2 = data.ranges[0:30] 
    right_2 = data.ranges[330:360]
    front_2 = data.ranges[0:5] + data.ranges[355:360]
    filtered_left = [num for num in left_2 if num<1000]
    filtered_right = [num for num in right_2 if num<1000]
    filtered_front = [num for num in front_2 if num<1000]
    try: 
        avgl = sum(filtered_left)/len(filtered_right)
        avgr = sum(filtered_right)/len(filtered_right)
        front_obst = min(filtered_front)
    except ZeroDivisionError:
        avgl = sum(filtered_left)/0.01
        avgr = sum(filtered_right)/0.01
        front_obst = 1000
    error = avgr - avgl
    print(error,front_obst)
    # avg_left =  divide(sum(filtered_front[0:30],len(filtered_front[0:30]))
    # avg_right = divide(sum(filtered_front[330:360]),len(filtered_front[330:360]))
    limit = 0.15

    if front_obst > 0.1:
        
        if -limit < error < limit :
            #go straight
            k = 1
            velocity_msg.linear.x = 0.2
            velocity_msg.angular.z = 0
        else:
            #turn
            kt = 1.5
            velocity_msg.linear.x = 0.0
            velocity_msg.angular.z = -kt*error
    else:
        velocity_msg.linear.x = 0
        velocity_msg.angular.z = 0.2
    
    pub.publish(velocity_msg)
rospy.init_node('turtle_control', anonymous=True)
velocity_msg=Twist()
pub = rospy.Publisher('cmd_vel', Twist, queue_size= 10)
scan = rospy.Subscriber('scan', LaserScan,callback)
rate = rospy.Rate(10)
while not rospy.is_shutdown():
    pub.publish(velocity_msg)
    rate.sleep()
    pass
