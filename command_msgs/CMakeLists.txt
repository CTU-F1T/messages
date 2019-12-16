cmake_minimum_required(VERSION 2.8.3)
project(command_msgs)

find_package(catkin REQUIRED
    COMPONENTS
    message_generation
    std_msgs
)

add_message_files(
    FILES
    Command.msg
    CommandParameter.msg
    CommandArrayStamped.msg
)

generate_messages(
    DEPENDENCIES
    std_msgs
)

catkin_package()
