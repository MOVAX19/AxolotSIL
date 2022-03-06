#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from pymavlink import mavutil
import sys
 
 
class WaypointsNode(Node):
    master = 0
    def __init__(self):
        super().__init__("waypoints_node")
        self.master = mavutil.mavlink_connection('udpin:0.0.0.0:14550')
        self.master.wait_heartbeat()
        self.takeoff()
        self.flight_guidance()

    def takeoff(self):
        nrdyFlag = True

        while nrdyFlag:
            ack_msg = self.master.recv_match(type='SYS_STATUS', blocking=True)
            #print(ack_msg.onboard_control_sensors_enabled)
            if ack_msg.onboard_control_sensors_enabled == 1382128815:
                nrdyFlag = False
        #flight mode
        mode = 'GUIDED'
        alt = 3

        # Check if mode is available
        if mode not in self.master.mode_mapping():
            #print('Unknown mode : {}'.format(mode))
            #print('Try:', list(self.master.mode_mapping().keys()))
            sys.exit(1)

        # Get mode ID
        mode_id = self.master.mode_mapping()[mode]
        self.master.mav.set_mode_send(
            self.master.target_system,
            mavutil.mavlink.MAV_MODE_FLAG_CUSTOM_MODE_ENABLED,
            mode_id)

        while True:
            # Wait for ACK command
            ack_msg = self.master.recv_match(type='COMMAND_ACK', blocking=True)
            ack_msg = ack_msg.to_dict()

            # Check if command in the same in `set_mode`
            if ack_msg['command'] != mavutil.mavlink.MAVLINK_MSG_ID_SET_MODE:
                continue

            #Print the ACK result !
            #print(mavutil.mavlink.enums['MAV_RESULT'][ack_msg['result']].description)
            break

        notRdy = True
        #Arming command
        #print("Arming motors")
        while notRdy:
            self.master.arducopter_arm()
            #print("Waiting for the vehicle to be ready for arming")
            ack_msg = self.master.recv_match(type='COMMAND_ACK', blocking=True)
            if ack_msg.result == 0:
                notRdy = False
        #print("Waiting for arming")
        self.master.motors_armed_wait()
        #print('Armed!')

        #Takeoff command
        #print("Takingoff")
        self.master.mav.command_long_send(self.master.target_system, self.master.target_component, mavutil.mavlink.MAV_CMD_NAV_TAKEOFF, 0, 0, 0, 0, 0, 0, 0, alt)

        msg = self.master.recv_match(type = 'COMMAND_ACK', blocking=True)
        #print(msg)
        #if not msg.result:
            #print("Succes!")
        #else:
            #print("Takeoff failed :(")

        #Waiting till takeoff is complete
        msg = self.master.recv_match( type='LOCAL_POSITION_NED', blocking = True)

        while abs(int(msg.z)) != alt:
            msg = self.master.recv_match( type='LOCAL_POSITION_NED', blocking = True)
            #print(msg.z)
 
    def waypoint(self, wp):
        x = int(wp[0]) 
        y = int(-wp[1]) 
        z = int(-wp[2])
        vx, vy, vz = 0, 0, 0
        yaw, yaw_r = 0, 0
        self.master.mav.send(mavutil.mavlink.MAVLink_set_position_target_local_ned_message(10, self.master.target_system, self.master.target_component, mavutil.mavlink.MAV_FRAME_LOCAL_NED, int(0x0DF8), x, y, z, vx, vy, vz, 0, 0, 0, yaw, yaw_r))

        msg = self.master.recv_match( type='NAV_CONTROLLER_OUTPUT', blocking = True)

        while msg.wp_dist:
            msg = self.master.recv_match( type='NAV_CONTROLLER_OUTPUT', blocking = True)
            #print(msg.wp_dist)

    def flight_guidance(self):
        pos = [ [35,0,3],
        [35,-17,2],
        [0,-17,3],
        [0,0,3]]

        while True:
            #print("First waypoint")
            self.waypoint(pos[0][:])
            #print("second waypoint")
            self.waypoint(pos[1][:])
            #print("third waypoint")
            self.waypoint(pos[2][:])
            #print("fourth waypoint")
            self.waypoint(pos[3][:])

def main(args=None):
    rclpy.init(args=args)
    node = WaypointsNode() 
    rclpy.spin(node)
    rclpy.shutdown()
 
 
if __name__ == "__main__":
    main()