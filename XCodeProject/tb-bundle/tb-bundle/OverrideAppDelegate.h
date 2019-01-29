// Murka Co.

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import "Override_OSX.h"
//#import "DeepLink.h"


@interface OverrideAppDelegate : NSObject
@property (nonatomic)NSTouchBar* staticBar;
//-(void)applicationDidFinishLaunching:(NSNotification*) notification;
-(void)applicationDidFinishLaunching:(id)application;
//-(void)original_saved_by_Override_applicationDidFinishLaunching:(NSNotification*) notification;
-(void)original_saved_by_Override_applicationDidFinishLaunching:(id)application;
- (NSTouchBar *)makeTouchBar;
- (nullable NSTouchBarItem *)touchBar:(NSTouchBar *)touchBar makeItemForIdentifier:(NSTouchBarItemIdentifier)identifier;

@end
