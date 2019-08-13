#include <iostream>

using std::cout;
using std::endl;

int main()
{
    int value = 0;
    int iterations = 10;

    for (int i = 0; i < iterations; i++)
    {
        value += i;
    }

    cout << value << endl;
    return 0;
}
