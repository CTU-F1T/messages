# Messages
Repository with our custom messages.

## Currently used

### autoware_auto_msgs
A partial port of [autoware_auto_msgs](https://index.ros.org/r/autoware_auto_msgs/) from ROS2 index. However, we currently reuse only two message definitions.

Note, that although `TrajectoryPoint.msg` differs between ROS versions, their usage is same.

[Trajectory.msg](autoware_auto_msgs/msg/Trajectory.msg)
```
# Trajectory message
std_msgs/Header header
autoware_auto_msgs/TrajectoryPoint[] points
```

TrajectoryPoint.msg (_ROS 1 version_)
```
# Point of a Trajectory
# Zero heading corresponds to the positive x direction in the given frame.
# All fields should default to 0.
# As noted in the original message, it is possible that more fields will
# be added overtime (e.g., jerk).
# Note: We use type duration instead of std_msgs/Duration to make the API
# consistent. The only difference is, that 'time_from_start.nsecs' is int32,
# whereas it is uint32 in ROS2.
duration time_from_start                # ROS duration, .secs and .nsecs
geometry_msgs/Pose pose
float32 longitudinal_velocity_mps       # [m.s^-1]
float32 lateral_velocity_mps            # [m.s^-1]
float32 acceleration_mps2               # [m.s^-2]
float32 heading_rate_rps                # [rad.s^-1]
float32 front_wheel_angle_rad           # [rad]
float32 rear_wheel_angle_rad            # [rad]
```

TrajectoryPoint.msg (_ROS 2 version_)
```
# Point of a Trajectory
# Zero heading corresponds to the positive x direction in the given frame.
# All fields should default to 0.
# As noted in the original message, it is possible that more fields will
# be added overtime (e.g., jerk).
# Note: We use type duration instead of std_msgs/Duration to make the API
# consistent. The only difference is, that 'time_from_start.nsecs' is int32,
# whereas it is uint32 in ROS2.
builtin_interfaces/Duration time_from_start                # ROS duration, .secs and .nsecs
geometry_msgs/Pose pose
float32 longitudinal_velocity_mps       # [m.s^-1]
float32 lateral_velocity_mps            # [m.s^-1]
float32 acceleration_mps2               # [m.s^-2]
float32 heading_rate_rps                # [rad.s^-1]
float32 front_wheel_angle_rad           # [rad]
float32 rear_wheel_angle_rad            # [rad]
```


### command_msgs
These messages are used for commanding nodes (e.g., Drive-API).

[CommandArrayStamped.msg](command_msgs/msg/CommandArrayStamped.msg)
```
# CommandArrayStamped message
# List of commands, with a timestamp
Header header
command_msgs/Command[] commands
```

[Command.msg](command_msgs/msg/Command.msg)
```
# Command message
string command
command_msgs/CommandParameter[] parameters
```

[CommandParameter.msg](command_msgs/msg/CommandParameter.msg)
```
# CommandParameter message
string parameter
float64 value
```

### obstacle_msgs
Messages for describing obstacles.

[ObstaclesStamped.msg](obstacle_msgs/msg/ObstaclesStamped.msg)
```
# ObstaclesStamped message
std_msgs/Header header
obstacle_msgs/Obstacles obstacles
```

[Obstacles.msg](obstacle_msgs/msg/Obstacles.msg)
```
# Obstacle message
obstacle_msgs/SegmentObstacle[] segments
obstacle_msgs/TriangleObstacle[] triangles
obstacle_msgs/CircleObstacle[] circles
```

[SegmentObstacle.msg](obstacle_msgs/msg/SegmentObstacle.msg)
```
geometry_msgs/Point[2] points
```

[TriangleObstacle.msg](obstacle_msgs/msg/TriangleObstacle.msg)
```
# Triangle obstacle
# Edges of a triangle
geometry_msgs/Point edge_a
geometry_msgs/Point edge_b
geometry_msgs/Point edge_c

# Velocity of obstacle (applied to center)
geometry_msgs/Vector3 velocity
```

[CircleObstacle.msg](obstacle_msgs/msg/CircleObstacle.msg)
```
# Circle obstacle
geometry_msgs/Point center
float64 radius

# Velocity of obstacle (applied to center)
geometry_msgs/Vector3 velocity
```

[ParkingSlot.msg](obstacle_msgs/msg/ParkingSlot.msg)
```
# Point `bnodes[0]` is used to get information about parking slot.
#
# From the order of border nodes `bnodes` the orientation of the slot is
# computed. Also, *parallel* or *perpendicular* classification and entry to
# slot is computed from these information.
geometry_msgs/Point[4] bnodes
```

### plan_msgs
Package for messages that are related to plans/planning. Nowadays, it is better to use `autoware_auto_msgs` instead, as its `Trajectory.msg` contains more data.

[Trajectory.msg](plan_msgs/msg/Trajectory.msg)
```
# Arrays that represent Trajectory for a vehicle to follow
std_msgs/Header header
geometry_msgs/Pose[] poses      # Positions and headings
float64[] curvatures            # Curvature of the path at each position [m^-1]
float64[] velocities            # Desired velocity at each position [m.s^-1]
float64[] accelerations         # Desired acceleration at each position [m.s^-2]
```

## ROS 2 only messages

As commented by [Martin Endler](https://github.com/pokusew/f1tenth-rewrite#pure-python-packages-cannot-contain-messages-definitions) pure Python packages in ROS2 do not support definition of messages. Therefore, the messages were separated into separate packages.

### drive_api_msgs
Messages used for controlling the Drive-API. **Use `command_msgs` instead.**

[DriveApiValues.msg](drive_api_msgs/msg/DriveApiValues.msg)
```
# Values for drive_api
float64 velocity        # allowed <0; 1>, positive values for forward direction
bool forward            # if true go forward, otherwise backwards
float64 steering        # allowed <0; 1>, positive values for right steering
bool right              # if true go right, otherwise left
# Note: Using negative values for velocity/steering will stop car/make it go straight.
```

### teensy_drive_msgs
Messages used between Drive-API and Teensy board (i.e., teensy-drive node). Basically they are a replacement for older `f1tenth_race`.

[DriveValues.msg](teensy_drive_msgs/msg/DriveValues.msg)
```
# PWM duty cycle (0-100%) corresponds to (0-65535) interval
int16 pwm_drive
int16 pwm_angle
```

[PwmHigh.msg](teensy_drive_msgs/msg/PwmHigh.msg)
```
uint32 period_thr
uint32 period_str
```


## Deprecated

### f1tenth_race
_ROS 1 only._ These messages were used for low level communication. They are left here as they can be used in some older nodes.

[drive_values.msg](f1tenth_race/msg/drive_values.msg)
```
# PWM duty cycle (0-100%) corresponds to (0-65535) interval
int16 pwm_drive
int16 pwm_angle
```

[pwm_high.msg](f1tenth_race/msg/pwm_high.msg)
```
uint32 period_thr
uint32 period_str
```

### trajectory
_ROS 1 only._ Our first message for describing the vehicle trajectory. In comparison to the `plan_msgs` version, this lacks header.

[Vehicle_trajectory.msg](trajectory/msg/Vehicle_trajectory.msg)
```
# Car trajectory message
geometry_msgs/Pose[] points
float64[] speed_profile
float64[] curvature
float64[] accels
```
