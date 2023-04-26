set(ROS_VERSION $ENV{ROS_VERSION})

if (NOT DEFINED ROS_VERSION OR ${ROS_VERSION} EQUAL 1)
    set (ROS_VERSION 1)
    cmake_minimum_required(VERSION 2.8.3)
    set(DURATION_TYPE "duration")
else()
    cmake_minimum_required(VERSION 3.3)
    set(DURATION_TYPE "builtin_interfaces/Duration")
endif()

project(autoware_auto_msgs)

# Generate TrajectoryPoint message
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/cmake/TrajectoryPoint.msg.in ${CMAKE_CURRENT_SOURCE_DIR}/msg/TrajectoryPoint.msg @ONLY)

# Message definitions
set(msg_files
    Trajectory.msg
    TrajectoryPoint.msg
)

# Dependencies
set(dep_pkgs
    std_msgs
    geometry_msgs
)


if (ROS_VERSION EQUAL 1)
    find_package(catkin REQUIRED
        COMPONENTS
        message_generation
        ${dep_pkgs}
    )

    add_message_files(
        FILES
        ${msg_files}
    )

    generate_messages(
        DEPENDENCIES
        ${dep_pkgs}
    )

    catkin_package()
elseif (ROS_VERSION EQUAL 2)
    find_package(ament_cmake REQUIRED)
    find_package(rosidl_default_generators REQUIRED)
    foreach (pkg ${dep_pkgs})
        find_package(${pkg} REQUIRED)
    endforeach()

    # https://stackoverflow.com/a/59155344
    function(list_transform_prepend var prefix)
        set(temp "")
        foreach(f ${${var}})
            list(APPEND temp "${prefix}${f}")
        endforeach()
        set(${var} "${temp}" PARENT_SCOPE)
    endfunction()

    list_transform_prepend(msg_files "msg/")

    rosidl_generate_interfaces(${PROJECT_NAME}
        ${msg_files}
        DEPENDENCIES
        ${dep_pkgs}
    )
    ament_export_dependencies(rosidl_default_runtime)

    ament_package()
else()
    message(FATAL_ERROR "ROS_VERSION is not set.")
endif()
