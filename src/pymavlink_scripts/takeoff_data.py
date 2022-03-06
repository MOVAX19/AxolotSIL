from pymavlink import mavutil
import csv


counter = 1
# Start a connection listening to a UDP port
the_connection = mavutil.mavlink_connection('udpin:localhost:14551')

# Wait for the first heartbeat 
#   This sets the system and component ID of remote system for the link
the_connection.wait_heartbeat()
print("Heartbeat from system (system %u component %u)" % (the_connection.target_system, the_connection.target_component))


#Arming command
the_connection.mav.command_long_send(the_connection.target_system, the_connection.target_component, mavutil.mavlink.MAV_CMD_COMPONENT_ARM_DISARM, 0, 1, 0, 0, 0, 0, 0, 0)

msg = the_connection.recv_match(type = 'COMMAND_ACK', blocking=True)
print(msg)


#Takeoff command
the_connection.mav.command_long_send(the_connection.target_system, the_connection.target_component, mavutil.mavlink.MAV_CMD_NAV_TAKEOFF, 0, 0, 0, 0, 0, 0, 0, 15)

msg = the_connection.recv_match(type = 'COMMAND_ACK', blocking=True)
print(msg)


with open('takeoff.csv', mode='w') as takeoff_file:
    t_writer = csv.writer(takeoff_file, delimiter=',')
    while True:
        msg = the_connection.recv_match(type = 'LOCAL_POSITION_NED', blocking=True)
        t_writer.writerow([msg.time_boot_ms, abs(msg.z), abs(msg.vz)])
        counter += 1