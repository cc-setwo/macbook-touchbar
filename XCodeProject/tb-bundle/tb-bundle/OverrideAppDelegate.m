// Murka Co.

#import "OverrideAppDelegate.h"

//static NSTouchBarItemIdentifier WindowControllerLabelIdentifier = @"com.TouchBarCatalog.windowController.label";
@implementation OverrideAppDelegate


#pragma mark Override implementations


//-(void)applicationDidFinishLaunching:(NSNotification*) notification
-(void)applicationDidFinishLaunching:(id)application
{
    NSLog(@"$[OverrideAppDelegate applicationDidFinishLaunching:%@]", application);
    if ([[NSApplication sharedApplication] respondsToSelector:@selector(isAutomaticCustomizeTouchBarMenuItemEnabled)])
    {
        [NSApplication sharedApplication].automaticCustomizeTouchBarMenuItemEnabled = YES;
    }
    return [self original_saved_by_Override_applicationDidFinishLaunching:application];
}

- (NSTouchBar *)makeTouchBar
{
    NSTouchBar *bar = [[NSTouchBar alloc] init];
    bar.delegate = self;
    
    // Set the default ordering of items.
    bar.defaultItemIdentifiers =
    @[@"com.TouchBarCatalog.windowController.label", NSTouchBarItemIdentifierOtherItemsProxy];
    NSLog(@"TB CREATED WITH SUCCESS!!!");
    _staticBar = bar;
    return bar;
}

- (nullable NSTouchBarItem *)touchBar:(NSTouchBar *)touchBar makeItemForIdentifier:(NSTouchBarItemIdentifier)identifier
{
    if ([identifier isEqualToString:@"com.TouchBarCatalog.windowController.label"])
    {
        NSTextField *theLabel = [NSTextField labelWithString:@"Выходные прошли не зря ;-)"];

        
        //NSButton *myButton = [[NSButton alloc] initWithFrame:NSMakeRect(0,0,100,100)];
        //[[windowOutlet contentView] addSubview: myButton];
        //[myButton setTitle: @"Button title!"];
        NSCustomTouchBarItem *customItemForLabel =
        [[NSCustomTouchBarItem alloc] initWithIdentifier:@"com.TouchBarCatalog.windowController.label"];
        customItemForLabel.view = theLabel;

        // We want this label to always be visible no matter how many items are in the NSTouchBar instance.
        customItemForLabel.visibilityPriority = NSTouchBarItemPriorityHigh;

        return customItemForLabel;
    }

    return nil;
}


#pragma mark Original implementation placeholders

//-(void)original_saved_by_Override_applicationDidFinishLaunching:(NSNotification*) notification
-(void)original_saved_by_Override_applicationDidFinishLaunching:(id)application
{ return; }

- (NSTouchBar *)original_makeTouchBar
{ return nil; }

@end
