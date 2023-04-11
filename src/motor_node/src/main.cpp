#include "motor_node/motor_node.hpp"


int main (int argc, char* argv[])
{

    ros::init(argc, argv, "motor_node_01");
    ros::NodeHandle nh;

    motor_node::MotorNode mn(nh);

    ros::spin();

    return 0;
}