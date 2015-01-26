//
// plum_ambient_light.c
//
// Ambient light reading for mac users.
//
// Thanks to: http://www.osxbook.com/book/bonus/chapter10/light/
// and http://forums.macrumors.com/archive/index.php/t-1133446.html
//
//
// Output:
//
//   <value> (a single integer number)
//
//
// How to read the output value (as experimented on my MBP5):
//
//   - Ambient light readings seem to range between 0 and 67,092,408. However
//     very high values can be registered mostly outdoor. I've found that
//     indoor values mostly range between 0 (completely dark room) and 
//     2,000,000 (well-lighted room).
//
//
#include <IOKit/IOKitLib.h>
#include <stdio.h>
#include <stdlib.h>


static mach_port_t dataPort = 0;

enum 
{
    kGetSensorReadingID = 0,
    kGetLEDBrightnessID = 1,
    kSetLEDBrightnessID = 2,
    kSetLEDFadeID = 3,
};


int main()
{
    kern_return_t kr;
    io_service_t serviceObject;

    // Look up the registered IOService object whose class is 'AppleLMUController'
    serviceObject = IOServiceGetMatchingService(kIOMasterPortDefault,
            IOServiceMatching("AppleLMUController"));
    if (!serviceObject) {
        fprintf(stderr, "failed to find the ambient light sensor");
        exit(1);
    }

    // Create a connection to the IOService object
    kr = IOServiceOpen(serviceObject, mach_task_self(), 0, &dataPort);
    IOObjectRelease(serviceObject);
    if (kr != KERN_SUCCESS) {
        fprintf(stderr, "failed to connect to the ambient light sensor");
        exit(kr);
    }

    // Get the AMBIENT LIGHT SENSOR reading
    uint32_t scalarOutputCount = 2;
    uint64_t values[scalarOutputCount];

    kr = IOConnectCallMethod(dataPort, kGetSensorReadingID,
            nil, 0, nil, 0, values, &scalarOutputCount, nil, 0);

    if (kr == KERN_SUCCESS) {
        // it seems that  values[0] and values[1] are qual so we just pick a single value
        fprintf(stdout, "%d", values[0]);
        exit(0);
    } else {
        exit(kr);
    }
}
