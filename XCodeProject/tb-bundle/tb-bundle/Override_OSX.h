// Murka Co.

#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

//! Project version number for Override_OSX.
FOUNDATION_EXPORT double Override_OSXVersionNumber;

//! Project version string for Override_OSX.
FOUNDATION_EXPORT const unsigned char Override_OSXVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <Override_OSX/PublicHeader.h>

#import "EPPZSwizzler.h"
#import "OverrideAppDelegate.h"
//#import "WindowController.h"


@interface Override_OSX : NSObject
+(int)swizzle;
@end
