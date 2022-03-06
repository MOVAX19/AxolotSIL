#include "rclcpp/rclcpp.hpp"
#include "sensor_msgs/msg/image.hpp"
#include "sensor_msgs/image_encodings.hpp"
#include <cv_bridge/cv_bridge.h>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>

class ComputerVisionNode : public rclcpp::Node
{
public:
    ComputerVisionNode() : Node("cpp_test")
    {
        RCLCPP_INFO(this->get_logger(), "Computer Vision Algorithm Node"); //Impresion en consola

        subscriber_ = this -> create_subscription<sensor_msgs::msg::Image>("/cam/image_raw", 10,
                                                                                std::bind(&ComputerVisionNode::imageProcessing, this, std::placeholders::_1));
    }

~ComputerVisionNode(){
    cv::destroyWindow(OPENCV_WINDOW);
}

private:
    rclcpp::Subscription<sensor_msgs::msg::Image>::SharedPtr subscriber_;
    const std::string OPENCV_WINDOW = "Original Image";
    cv::Mat image, imgBGR, imgHSV, imgThresholded;
    const int iLowH = 0, iHighH = 26;
    const int iLowS = 106, iHighS = 255;
    const int iLowV = 67, iHighV = 200;
    void imageProcessing(const sensor_msgs::msg::Image::SharedPtr msg)
    {
        //RCLCPP_INFO(this->get_logger(), "Receiving video frame");
        cv_bridge::CvImagePtr cv_ptr;
        try
        {
            cv_ptr = cv_bridge::toCvCopy(msg, msg->encoding);
        }
        catch (cv_bridge::Exception& e)
        {
            RCLCPP_ERROR(this->get_logger(), "cv_bridge exception: %s", e.what());
            return;
        }
        image = cv_ptr->image;
        cv::cvtColor(image, imgBGR, cv::COLOR_RGB2BGR);
        cv::cvtColor(imgBGR, imgHSV, cv::COLOR_BGR2HSV); //Convert the captured frame from BGR to HSV
		cv::inRange(imgHSV, cv::Scalar(iLowH, iLowS, iLowV), cv::Scalar(iHighH, iHighS, iHighV), imgThresholded); //Threshold the image
      
		//morphological opening (removes small objects from the foreground)
		cv::erode(imgThresholded, imgThresholded, cv::getStructuringElement(cv::MORPH_ELLIPSE, cv::Size(5, 5)) );
		cv::dilate( imgThresholded, imgThresholded, cv::getStructuringElement(cv::MORPH_ELLIPSE, cv::Size(5, 5)) ); 

		//morphological closing (removes small holes from the foreground)
		cv::dilate( imgThresholded, imgThresholded, cv::getStructuringElement(cv::MORPH_ELLIPSE, cv::Size(5, 5)) ); 
		cv::erode(imgThresholded, imgThresholded, cv::getStructuringElement(cv::MORPH_ELLIPSE, cv::Size(5, 5)) );

        cv::imshow(OPENCV_WINDOW, imgBGR);
        cv::imshow("Thresholded Image", imgThresholded);
        cv::waitKey(3);
    }
};

int main(int argc, char **argv)
{
    rclcpp::init(argc, argv); //Comunicaciones de ROS2
    auto node = std::make_shared<ComputerVisionNode>();
    rclcpp::spin(node); //Pausa el programay mantiene el nodo con vida
    rclcpp::shutdown();
    return 0;
}