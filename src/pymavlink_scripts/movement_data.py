from pymavlink import mavutil
import csv
# Start a connection listening to a UDP port
the_connection = mavutil.mavlink_connection('udpin:localhost:14551')

# Wait for the first heartbeat 
#   This sets the system and component ID of remote system for the link
the_connection.wait_heartbeat()
print("Heartbeat from system (system %u component %u)" % (the_connection.target_system, the_connection.target_component))


#the_connection.mav.send(mavutil.mavlink.MAVLink_set_position_target_local_ned_message(10, the_connection.target_system, the_connection.target_component,mavutil.mavlink.MAV_FRAME_LOCAL_NED, int(0x0DF8), 40, 0, -10, 0, 0, 0, 0, 0, 0, 0, 0))

print("First waypoint")
the_connection.mav.send(mavutil.mavlink.MAVLink_set_position_target_local_ned_message(10, the_connection.target_system, the_connection.target_component,mavutil.mavlink.MAV_FRAME_LOCAL_NED, int(0x0DF8), 35, 0, -3, 0, 0, 0, 0, 0, 0, 0, 0))

msg = the_connection.recv_match( type='NAV_CONTROLLER_OUTPUT', blocking = True)

with open('movement.csv', mode='w') as takeoff_file:
    t_writer = csv.writer(takeoff_file, delimiter=',')
    while msg.wp_dist:
        msg = the_connection.recv_match(type = 'LOCAL_POSITION_NED', blocking=True)
        t_writer.writerow([msg.time_boot_ms, abs(msg.x), abs(msg.vx),abs(msg.y), abs(msg.vy),abs(msg.z), abs(msg.vz)])
        msg = the_connection.recv_match( type='NAV_CONTROLLER_OUTPUT', blocking = True)
        #data = list(msg.values())
        #print(msg)

    print("Second waypoint")
    the_connection.mav.send(mavutil.mavlink.MAVLink_set_position_target_local_ned_message(10, the_connection.target_system, the_connection.target_component,mavutil.mavlink.MAV_FRAME_LOCAL_NED, int(0x0DF8), 35, 17, -2, 0, 0, 0, 0, 0, 0, 1.57, 0))

    msg = the_connection.recv_match( type='NAV_CONTROLLER_OUTPUT', blocking = True)

    while msg.wp_dist:
        msg = the_connection.recv_match(type = 'LOCAL_POSITION_NED', blocking=True)
        t_writer.writerow([msg.time_boot_ms, abs(msg.x), abs(msg.vx),abs(msg.y), abs(msg.vy),abs(msg.z), abs(msg.vz)])
        msg = the_connection.recv_match( type='NAV_CONTROLLER_OUTPUT', blocking = True)
        #data = list(msg.values())
        print(msg.wp_dist)
        #print(msg)

    while True:
        msg = the_connection.recv_match(type = 'LOCAL_POSITION_NED', blocking=True)
        t_writer.writerow([msg.time_boot_ms, abs(msg.x), abs(msg.vx),abs(msg.y), abs(msg.vy),abs(msg.z), abs(msg.vz)])