// Murka Co.

#include "Plugin.h"
//#include "OSLink.h"
#include "Override_OSX.h"

//const char* ReturnString(){
//    return [[OSLink returnString] cStringUsingEncoding:NSUTF8StringEncoding];
//}

int InitTB(){
    //return 4;
    [Override_OSX load];
    //[Override_OSX swizzle];
    //int bas= *(int*)[Override_OSX getin];
    return [Override_OSX swizzle];
	//return [OSLink returnInt];
}
