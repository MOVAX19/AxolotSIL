"""
Mission for flight navigation of UAV
"""

import sys
# Import mavutil
from pymavlink import mavutil
import csv

# Create the connection
master = mavutil.mavlink_connection('udpin:0.0.0.0:14550')
# Wait a heartbeat before sending commands
master.wait_heartbeat()


#########################
# Parameters for flight #
#########################

#flight mode
mode = 'GUIDED'
alt = 3

# Check if mode is available
if mode not in master.mode_mapping():
    print('Unknown mode : {}'.format(mode))
    print('Try:', list(master.mode_mapping().keys()))
    sys.exit(1)

# Get mode ID
mode_id = master.mode_mapping()[mode]
# Set new mode
# master.mav.command_long_send(
#    master.target_system, master.target_component,
#    mavutil.mavlink.MAV_CMD_DO_SET_MODE, 0,
#    0, mode_id, 0, 0, 0, 0, 0) or:
# master.set_mode(mode_id) or:
master.mav.set_mode_send(
    master.target_system,
    mavutil.mavlink.MAV_MODE_FLAG_CUSTOM_MODE_ENABLED,
    mode_id)

while True:
    # Wait for ACK command
    ack_msg = master.recv_match(type='COMMAND_ACK', blocking=True)
    ack_msg = ack_msg.to_dict()

    # Check if command in the same in `set_mode`
    if ack_msg['command'] != mavutil.mavlink.MAVLINK_MSG_ID_SET_MODE:
        continue

    # Print the ACK result !
    print(mavutil.mavlink.enums['MAV_RESULT'][ack_msg['result']].description)
    break

#Arming command
print("Arming motors")
master.mav.command_long_send(master.target_system, master.target_component, mavutil.mavlink.MAV_CMD_COMPONENT_ARM_DISARM, 0, 1, 0, 0, 0, 0, 0, 0)

msg = master.recv_match(type = 'COMMAND_ACK', blocking=True)
print(msg)
if not msg.result:
    print("Succes!")
else:
    print("Arm failed :(")


#Takeoff command
print("Takingoff")
master.mav.command_long_send(master.target_system, master.target_component, mavutil.mavlink.MAV_CMD_NAV_TAKEOFF, 0, 0, 0, 0, 0, 0, 0, alt)

msg = master.recv_match(type = 'COMMAND_ACK', blocking=True)
print(msg)
if not msg.result:
    print("Succes!")
else:
    print("Takeoff failed :(")

#Waiting till takeoff is complete
msg = master.recv_match( type='LOCAL_POSITION_NED', blocking = True)

while abs(int(msg.z)) != alt:
    msg = master.recv_match( type='LOCAL_POSITION_NED', blocking = True)
    print(msg.z)

with open('mission.csv', mode='w') as takeoff_file:
    t_writer = csv.writer(takeoff_file, delimiter=',')

    def waypoint(wp):
        x = int(wp[0]) 
        y = int(-wp[1]) 
        z = int(-wp[2])
        vx, vy, vz = 0, 0, 0
        yaw, yaw_r = 0, 0
        master.mav.send(mavutil.mavlink.MAVLink_set_position_target_local_ned_message(10, master.target_system, master.target_component, mavutil.mavlink.MAV_FRAME_LOCAL_NED, int(0x0DF8), x, y, z, vx, vy, vz, 0, 0, 0, yaw, yaw_r))

        msg = master.recv_match( type='NAV_CONTROLLER_OUTPUT', blocking = True)

        while msg.wp_dist:
            msg = master.recv_match(type = 'LOCAL_POSITION_NED', blocking=True)
            t_writer.writerow([msg.time_boot_ms, abs(msg.x), abs(msg.vx),abs(msg.y), abs(msg.vy),abs(msg.z), abs(msg.vz)])
            msg = master.recv_match( type='NAV_CONTROLLER_OUTPUT', blocking = True)
            print(msg.wp_dist)


    pos = [ [35,0,3],
            [35,-17,2],
            [0,-17,3],
            [0,0,3],
            [0,0,3]]


    print("First waypoint")
    waypoint(pos[0][:])
    print("second waypoint")
    waypoint(pos[1][:])
    print("third waypoint")
    waypoint(pos[2][:])
    print("fourth waypoint")
    waypoint(pos[3][:])
    print("fitfth waypoint")
    waypoint(pos[4][:])
    
    while True:
        msg = master.recv_match(type = 'LOCAL_POSITION_NED', blocking=True)
        t_writer.writerow([msg.time_boot_ms, abs(msg.x), abs(msg.vx),abs(msg.y), abs(msg.vy),abs(msg.z), abs(msg.vz)])
