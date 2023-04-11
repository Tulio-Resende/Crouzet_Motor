#ifndef MOTOR_NODE_MOTOR_NODE_HPP
#define MOTOR_NODE_MOTOR_NODE_HPP

#include "motor_node/VelCommunication.h"

#include <string>
#include <fcntl.h>
#include <string.h>
#include <termios.h>
#include <unistd.h>

#include <geometry_msgs/Vector3Stamped.h>

#include <ros/ros.h>


#include <boost/chrono.hpp>
#include <boost/thread.hpp>

#define BOLD_RED "\033[1;31m"
#define BOLD_GREEN "\033[1;32m"
#define BOLD_YELLOW "\033[1;33m"

// #include <CppLinuxSerial/SerialPort.hpp>
// using namespace mn::CppLinuxSerial;

namespace motor_node
{

    class MotorNode
    {
        public:
            MotorNode(ros::NodeHandle &nh);
            ~MotorNode();

            bool SerialServerCallback(motor_node::VelCommunication::Request &req,
                                   motor_node::VelCommunication::Response &res);


            void adjustPortSettings();
            // void setConfigurations();
            void startReading();
            void stopReading();
            void readingLoop();
            void readMsg();
            char serialRead();
            void publishMsg(std::string serial_msg);

        private:
        
            ros::NodeHandle &nh;
            ros::ServiceServer motor_vel_srv;
            ros::Publisher motor_vel_pub;

            // SerialPort serialPort;

            int serial_port;
            termios tty;

            bool is_reading;
            boost::thread read_thread;

   

    };
}


#endif