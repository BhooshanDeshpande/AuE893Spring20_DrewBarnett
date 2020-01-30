#!/usr/bin/env python
import rospy
from geometry_msgs.msg import Twist
PI = 3.1415926535897

def move():
    # Starts a new node
    rospy.init_node('circle_bot', anonymous=True)
    velocity_publisher = rospy.Publisher('/turtle1/cmd_vel', Twist, queue_size=10)
    vel_msg = Twist()
    
    #Receiveing the user's input
    print("Let's move your robot")
    distance = PI
    angleRate = 2*PI/distance
    speed = 0.95
    
    vel_msg.linear.x = abs(speed)
    vel_msg.linear.y = 0
    vel_msg.linear.z = 0
    vel_msg.angular.x = 0
    vel_msg.angular.y = 0
    vel_msg.angular.z = angleRate	

    while not rospy.is_shutdown():

        #Setting the current time for distance calculus
        t0 = float(rospy.Time.now().to_sec())
        current_distance = 0
        #Loop to move the turtle in an specified distance
        while(current_distance < distance):
            velocity_publisher.publish(vel_msg)
            t1=float(rospy.Time.now().to_sec())
            #Calculates distancePoseStamped
            current_distance= speed*(t1-t0)
        
       #Force the robot to stop
        vel_msg.linear.x = 0
        vel_msg.angular.z = 0
        velocity_publisher.publish(vel_msg)
        break

if __name__ == '__main__':
    try:
        move()
    except rospy.ROSInterruptException: pass
