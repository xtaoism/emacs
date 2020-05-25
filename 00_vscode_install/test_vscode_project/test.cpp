#include <stdio.h>
#include <iostream>
using namespace std;
// FIXME:
int main()
{
    for ( int i = 0; i < 100; i++ )
    {
        if ( (i%10) == 0 )
            printf( "ok=%d\n", i );
    }
    cout << "c++ ok" << endl;
    printf( "shit\n" );
    system( "pause" );
    return 0;
}