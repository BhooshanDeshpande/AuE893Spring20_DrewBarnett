#!/usr/bin/env python
import rospy
from geometry_msgs.msg  import Twist
from turtlesim.msg import Pose
from math import pow,atan2,sqrt

# Define points for square
xarr = [5,8,8,5,5]
yarr = [5,5,8,8,5]

class turtlebot():

    def __init__(self):
        #Creating our node,publisher and subscriber
        rospy.init_node('squarebot_CL', anonymous=True)
        self.velocity_publisher = rospy.Publisher('/turtle1/cmd_vel', Twist, queue_size=10)
        self.pose_subscriber = rospy.Subscriber('/turtle1/pose', Pose, self.callback)
        self.pose = Pose()
        self.rate = rospy.Rate(10)

    #Callback function implementing the pose value received
    def callback(self, data):
        self.pose = data
        self.pose.x = round(self.pose.x, 4)
        self.pose.y = round(self.pose.y, 4)

    def get_distance(self, goal_x, goal_y):
        distance = sqrt(pow((goal_x - self.pose.x), 2) + pow((goal_y - self.pose.y), 2))
        return distance

    def move2goal(self):
        goal_pose = Pose()
        goal_pose.x = xi
        goal_pose.y = yi
        distance_tolerance = .1
        vel_msg = Twist()


        while sqrt(pow((goal_pose.x - self.pose.x), 2) + pow((goal_pose.y - self.pose.y), 2)) >= distance_tolerance:

            relative_angle = atan2(goal_pose.y - self.pose.y, goal_pose.x - self.pose.x)-self.pose.theta
            while (abs(relative_angle) >= .01):
                #angular velocity in the z-axis:
                vel_msg.linear.x = 0
                vel_msg.linear.y = 0
                vel_msg.linear.z = 0
                vel_msg.angular.x = 0
                vel_msg.angular.y = 0
                vel_msg.angular.z = 4 * (atan2(goal_pose.y - self.pose.y, goal_pose.x - self.pose.x) - self.pose.theta)
                relative_angle = atan2(goal_pose.y - self.pose.y, goal_pose.x - self.pose.x)-self.pose.theta
                # print(relative_angle)
                self.velocity_publisher.publish(vel_msg)
                
            current_distance = sqrt(pow((goal_pose.x - self.pose.x), 2) + pow((goal_pose.y - self.pose.y), 2))
            while (abs(current_distance) >= distance_tolerance):
                #Porportional Controller
                #linear velocity in the x-axis:
                vel_msg.linear.x = 2 * sqrt(pow((goal_pose.x - self.pose.x), 2) + pow((goal_pose.y - self.pose.y), 2))
                vel_msg.linear.y = 0
                vel_msg.linear.z = 0
                vel_msg.angular.x = 0
                vel_msg.angular.y = 0
                vel_msg.angular.z = 0 
                current_distance = sqrt(pow((goal_pose.x - self.pose.x), 2) + pow((goal_pose.y - self.pose.y), 2))
                # print(current_distance)
                #Publishing our vel_msg
                self.velocity_publisher.publish(vel_msg)
                # self.rate.sleep()

        #Stopping our robot after the movement is over
        vel_msg.linear.x = 0
        vel_msg.angular.z =0
        self.velocity_publisher.publish(vel_msg)

        # rospy.spin()

if __name__ == '__main__':
    try:
        #Testing our function
        x = turtlebot()
        
        for i in range(len(xarr)):
            xi = xarr[i]
            yi = yarr[i]
            x.move2goal()

    except rospy.ROSInterruptException: pass
