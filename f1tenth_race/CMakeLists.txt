cmake_minimum_required(VERSION 2.8.3)
project(f1tenth_race)

find_package(catkin REQUIRED
    COMPONENTS
    message_generation
)

add_message_files(
    FILES
    drive_values.msg
    pwm_high.msg
)

generate_messages(
    DEPENDENCIES
)

catkin_package()
