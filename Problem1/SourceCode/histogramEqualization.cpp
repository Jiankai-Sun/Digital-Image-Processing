#include <opencv2/opencv.hpp>
#include <iostream>
#include <stdio.h>

using namespace cv;
using namespace std;

/** @function main **/
int main( int argc, char ** argv )
{
    Mat src, dst;

    // Load original image
    src = imread("../fig/Fig1.jpg", 0);

    // Histogram Equalization
    equalizeHist( src, dst );
    // Show the result
    namedWindow( "Source image", CV_WINDOW_AUTOSIZE );
    namedWindow( "Equalized Image", CV_WINDOW_AUTOSIZE );

    imshow("Source image", src);
    imshow("Equalized Image", dst);

    // Wait for exit
    waitKey(0);

    return 0;
}
