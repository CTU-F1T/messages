cmake_minimum_required(VERSION 2.8.3)
project(trajectory)

find_package(catkin REQUIRED
    COMPONENTS
    message_generation
    geometry_msgs
)

add_message_files(
    FILES
    Vehicle_trajectory.msg
)

generate_messages(
    DEPENDENCIES
    geometry_msgs
)
