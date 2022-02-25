# Arrays that represent Trajectory for a vehicle to follow
std_msgs/Header header
geometry_msgs/Pose[] poses      # Positions and headings
float64[] curvatures            # Curvature of the path at each position [m^-1]
float64[] velocities            # Desired velocity at each position [m.s^-1]
float64[] accelerations         # Desired acceleration at each position [m.s^-2]
