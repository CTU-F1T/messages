# Messages
Repository with our custom messages.


## command_msgs
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


## f1tenth_race
(Deprecated)
These messages were used for low level communication. They are left here as they can be used in some older nodes.

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


## trajectory
(Deprecated, use `plan_msgs`)
Our first message for describing the vehicle trajectory. In comparison to the `plan_msgs` version, this lacks header.

[Vehicle_trajectory.msg](trajectory/msg/Vehicle_trajectory.msg)
```
# Car trajectory message
geometry_msgs/Pose[] points
float64[] speed_profile
float64[] curvature 
float64[] accels
```


## obstacle_msgs
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


## plan_msgs
Package for messages that are related to plans/planning.

[Trajectory.msg](plan_msgs/msg/Trajectory.msg)
```
# Arrays that represent Trajectory for a vehicle to follow
std_msgs/Header header
geometry_msgs/Pose[] poses      # Positions and headings
float64[] curvatures            # Curvature of the path at each position [m^-1]
float64[] velocities            # Desired velocity at each position [m.s^-1]
float64[] accelerations         # Desired acceleration at each position [m.s^-2]
```
