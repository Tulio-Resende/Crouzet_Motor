#include "motor_node/motor_node.hpp"
#include "std_msgs/String.h"
#include <string>
#include <thread>

using namespace motor_node;


MotorNode::MotorNode(ros::NodeHandle &nh) :
    nh(nh), serial_port(-1), is_reading(false)
{
	adjustPortSettings();

	boost::this_thread::sleep_for(boost::chrono::milliseconds(100));

	// setConfigurations();

	startReading();

    motor_vel_srv = nh.advertiseService("/motor_vel_server", &MotorNode::SerialServerCallback, this);
    motor_vel_pub = nh.advertise<std_msgs::String>("/motor_vel_topic",10);

}


// void MotorNode::readMsg(int milliseconds)
// {
//     boost::chrono::steady_clock::time_point ti = boost::chrono::steady_clock::now();


//     while ( boost::chrono::duration_cast<boost::chrono::milliseconds>(boost::chrono::steady_clock::now() - ti).count() < milliseconds )
//         std::cerr << BOLD_GREEN << serialRead();
// }


bool MotorNode::SerialServerCallback(motor_node::VelCommunication::Request &req,
                                            motor_node::VelCommunication::Response &res)
{
    
    std::string s = std::to_string(req.a);
    char const *pchar = s.c_str();  //use char const* as target type

    int writeResult = write(serial_port, pchar, sizeof(pchar));

    if(writeResult ==-1)
    {
        res.result = false;
        std::cerr << BOLD_RED
            << "[ ERROR] Failed to write data through the serial port."
            << std::endl;
        
    }else
    {
        std::cerr << BOLD_GREEN
            << "[ INFO] Sending " 
            << pchar
            << " to arduino."
            << std::endl;
        res.result = true;
    }

    // serialPort.Write(std::to_string(req.a));
    //ROS_INFO("Write %s", std::to_string(req.a).c_str());

	return res.result;
}


void MotorNode::adjustPortSettings()
{	
    std::cout << BOLD_GREEN << "[ INFO] Setting serial port configurations." << std::endl;
    serial_port = open("/dev/ttyACM0", O_RDWR);

    if (serial_port < 0)
    {
        throw std::runtime_error(BOLD_RED "[ ERROR] Failed to open serial port.");
    }
        
    // Read in existing settings, and handle any error
    if(tcgetattr(serial_port, &tty) != 0) {
        std::cerr << BOLD_RED
            << "[ ERROR] Error with current serial port attibutes."
            << std::endl;

    }

    tty.c_cflag &= ~PARENB;
    tty.c_cflag &= ~CSTOPB;
    tty.c_cflag &= ~CSIZE;
    tty.c_cflag |= CS8;
    tty.c_cflag &= ~CRTSCTS;
    tty.c_cflag |= CREAD | CLOCAL;

    tty.c_lflag &= ~ICANON;
    tty.c_lflag &= ~ECHO;
    tty.c_lflag &= ~ECHOE;
    tty.c_lflag &= ~ECHONL;
    tty.c_lflag &= ~ISIG;
    tty.c_iflag &= ~(IXON | IXOFF | IXANY);
    tty.c_iflag &= ~(IGNBRK|BRKINT|PARMRK|ISTRIP|INLCR|IGNCR|ICRNL);

    tty.c_oflag &= ~OPOST;
    tty.c_oflag &= ~ONLCR;

    tty.c_cc[VTIME] = 10;
    tty.c_cc[VMIN] = 0;


    // Set in/out baud rate to be 9600
    cfsetispeed(&tty, B9600);
    cfsetospeed(&tty, B9600);

    // Save tty settings, also checking for error
    if (tcsetattr(serial_port, TCSANOW, &tty) != 0) {
        std::cerr << BOLD_RED
            << "[ ERROR] Failed to set serial port attibutes."
            << std::endl;

    }
}

void MotorNode::startReading()
{
    if (!is_reading)
    {
        std::cerr << BOLD_YELLOW
                  << "[ WARN] Entering reading loop."
                  << std::endl;
        is_reading = true;
        read_thread = boost::thread(&MotorNode::readingLoop, this);
    }
}

void MotorNode::readingLoop()
{
    std::string aux;
    bool save = false;


    while (nh.ok() && is_reading)
    {
        char buffer = serialRead();
        
        if (save && buffer!= int(3))
            aux += buffer;

        if (buffer == int(2))       //search for <STX> and start saving
            save = true;
        else if(buffer == int(3))   //search for <ETX> and stop saving
        {
            save = false;
            publishMsg(aux);
            aux.clear();
        }
    }

    return;
}

char MotorNode::serialRead()
{

    char buffer[1];
    memset(&buffer, char(0), sizeof(buffer));
    read(serial_port, &buffer, sizeof(buffer));
    return *buffer;

}

void MotorNode::publishMsg(std::string serial_msg)
{
    
    if (!serial_msg.empty())
    {
        std_msgs::String msg;
        msg.data = serial_msg;

        motor_vel_pub.publish(msg);
    }
    
}

void MotorNode::stopReading()
{
    if (is_reading)
    {
        std::cerr << BOLD_YELLOW
                  << "[ WARN] Reading loop returned."
                  << std::endl;
        is_reading = false;
        read_thread.join();
    }
}

MotorNode::~MotorNode()
{
    // serialPort.Close();

    stopReading();
    std::cerr << BOLD_YELLOW
              << "[ WARN] Exiting."
              << std::endl;
    std::cerr << BOLD_RED << std::endl;

}