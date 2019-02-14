cmake_minimum_required(VERSION 2.8.3)
project(obstacle_msgs)

find_package(catkin REQUIRED
    COMPONENTS
    message_generation
    geometry_msgs
)

add_message_files(
    FILES
    SegmentObstacle.msg
    TriangleObstacle.msg
    CircleObstacle.msg
    Obstacles.msg
)

generate_messages(
    DEPENDENCIES
    geometry_msgs
)
