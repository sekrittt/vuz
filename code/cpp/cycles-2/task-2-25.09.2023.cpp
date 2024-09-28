#include <iostream>

using namespace std;
void main()
{
    int i = 0; // Parameter description and init
    do
    {
        if ((i % 2 == 1) && (i % 3 == 2) && (i % 4 == 3) && (i % 5 == 4) && (i % 6 == 5) && (i % 7 == 6))
        {
            cout << i << endl;
        }
    } while (i++ < 500);
}
/*
Output:
    419
    839
    1259
    1679
    2099
    2519
    2939
    3359
    3779
    4199
    4619
    5039
    5459
    5879
    6299
    6719
    7139
    7559
    7979
    8399
    8819
    9239
    9659
*/
