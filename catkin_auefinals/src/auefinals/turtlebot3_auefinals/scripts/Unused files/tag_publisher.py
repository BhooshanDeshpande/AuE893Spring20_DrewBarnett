#!/usr/bin/env python

import rospy
from std_msgs.msg import Int32
import rospy
import numpy as np
from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan
from sensor_msgs.msg import Image
from apriltag_ros.msg import AprilTagDetection
from apriltag_ros.msg import AprilTagDetectionArray
import math
import time
import warnings
import random
import numpy as np 

prev_tag_id = 0
tag_id = 5
x_tag = float('inf') 
y_tag = float('inf')
z_ang_tag = float('inf')

def tag_callback(data):
    global x_tag,y_tag,z_ang_tag
    if data.detections:
        # set tag values
        set_tag_id(data.detections[0].id[0])
        x_tag = abs(data.detections[0].pose.pose.pose.position.x)
        y_tag  = abs(data.detections[0].pose.pose.pose.position.y)
        z_ang_tag = abs(data.detections[0].pose.pose.pose.orientation.z)
    else:
        # flush tag values
        tag_id = 5
        x_tag = float('inf') 
        y_tag = float('inf')
        z_ang_tag = float('inf')
        pass

def set_tag_id(data):
    global tag_id
    distance = get_distance()
    if data == 0 and distance:
        tag_id = 0
        save_tag()
    elif data == 1 and distance >= 0.02287:
        tag_id = retrieve_prev_tag()
    elif data == 1 and distance < 0.02287:
        tag_id = 1
        save_tag()
    elif data == 2 and distance >= 0.215:
        tag_id = retrieve_prev_tag()
    elif data == 2 and distance < 0.215:
        tag_id = 2
        save_tag()
    elif data == 3 and distance >= 0.004:
        tag_id = retrieve_prev_tag()
    elif data == 3 and distance < 0.004:
        tag_id = 3
        save_tag()
    elif data == 5:
        tag_id = retrieve_prev_tag
    else: 
        print('logic out of bound')

def save_tag():
    global prev_tag_id,tag_id
    prev_tag_id = tag_id 

def retrieve_prev_tag():
    global prev_tag_id
    return prev_tag_id

def get_distance():
    if isinstance(x_tag,float) and isinstance(y_tag,float):
        return y_tag
    else: 
        print("Distance cannot be measured")
        return float('inf')

def publish_tag():
    global tag_id
    msg = Int32()
    while not rospy.is_shutdown():
        msg = tag_id
        tag_publisher.publish(msg)
        rate.sleep()

if __name__ == '__main__':
    try:
        rospy.init_node('autonomous_control', anonymous=True)
        rospy.Subscriber("/tag_detections", AprilTagDetectionArray,tag_callback)
        tag_publisher = rospy.Publisher("/tag_publisher", Int32,queue_size= 10)
        rate = rospy.Rate(10)
        publish_tag()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
    
        