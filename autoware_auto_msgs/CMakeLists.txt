cmake_minimum_required(VERSION 2.8.3)
project(autoware_auto_msgs)

find_package(catkin REQUIRED
    COMPONENTS
    message_generation
    std_msgs
    geometry_msgs
)

add_message_files(
    FILES
    Trajectory.msg
    TrajectoryPoint.msg
)

generate_messages(
    DEPENDENCIES
    std_msgs
    geometry_msgs
)

catkin_package()
