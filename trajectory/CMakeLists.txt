set(ROS_VERSION $ENV{ROS_VERSION})

if (NOT DEFINED ROS_VERSION OR '${ROS_VERSION} STREQUAL '1)
    set (ROS_VERSION 1)
    cmake_minimum_required(VERSION 2.8.3)
else()
    cmake_minimum_required(VERSION 3.3)
endif()

project(trajectory)

set(msg_files
    Vehicle_trajectory.msg
)

set(dep_pkgs
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
#    find_package(ament_cmake REQUIRED)
#    find_package(rosidl_default_generators REQUIRED)
#    foreach (pkg ${dep_pkgs})
#        find_package(${pkg} REQUIRED)
#    endforeach()
#
#    # https://stackoverflow.com/a/59155344
#    function(list_transform_prepend var prefix)
#        set(temp "")
#        foreach(f ${${var}})
#            list(APPEND temp "${prefix}${f}")
#        endforeach()
#        set(${var} "${temp}" PARENT_SCOPE)
#    endfunction()
#
#    list_transform_prepend(msg_files "msg/")
#
#    rosidl_generate_interfaces(${PROJECT_NAME}
#        ${msg_files}
#        DEPENDENCIES
#        ${dep_pkgs}
#    )
#    ament_export_dependencies(rosidl_default_runtime)
#
#    ament_package()
    message("This package is enabled for ROS1 only. Skipping.")
else()
    message(FATAL_ERROR "ROS_VERSION is not set.")
endif()
