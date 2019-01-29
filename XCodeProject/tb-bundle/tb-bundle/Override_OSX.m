// Murka Co.

#import "Override_OSX.h"


@implementation Override_OSX

+(void)load
{
    NSLog(@"[Override_OSX load]");
    //[self swizzle];
}

+(int)swizzle
{
    int result = 0;
    @try {
    NSLog(@"$$[Override_OSX swizzle]");
    [self replaceAppDelegateMethod:@selector(applicationDidFinishLaunching:)
                         fromClass:OverrideAppDelegate.class
                  savingOriginalTo:@selector(original_saved_by_Override_applicationDidFinishLaunching:)];
    //AppendReplaceController

    Class appendReplaceController = NSClassFromString(@"EditorApplicationPrincipalClass");
    //(SEL)makeItemForIdentifier identifier:@""
    [EPPZSwizzler addInstanceMethod:@selector(makeTouchBar)
                            toClass:appendReplaceController
                          fromClass:OverrideAppDelegate.class];
    
    //[EPPZSwizzler addPropertyNamed:@"staticBar" toClass:appendReplaceController fromClass:OverrideAppDelegate.class];
    
    //SEL twoParameterSelector = @selector(makeItemForIdentifier:identifier:);
    
    [EPPZSwizzler addInstanceMethod:@selector(touchBar:makeItemForIdentifier:)
                            toClass:appendReplaceController
                          fromClass:OverrideAppDelegate.class];
//    [self replaceAppDelegateMethod:@selector(makeTouchBar:)
//                         fromClass:OverrideAppDelegate.class
//                  savingOriginalTo:@selector(original_saved_by_Override_applicationDidFinishLaunching:)];
//    Class appendReplaceController = NSClassFromString(@"AppendReplaceController");
//    [EPPZSwizzler addInstanceMethod:"makeTouchBar"
//                            toClass:appendReplaceController
//                          fromClass:OverrideAppDelegate.class];
//    //[OverrideAppDelegate makeTouchBarr];
//    Method method = class_getClassMethod(OverrideAppDelegate.class, "makeTouchBar");
//
//    // Checks.
//    if (method == nil)
//    {  NSLog(@"GAV");};
    //IMP imp = method_getImplementation(method);
    //BOOL success = class_addMethod(metaclass, @selector(makeTouchBar:), (IMP)_null, "@@:ff");
//    [EPPZSwizzler addInstanceMethod:@selector(Override_OSX:mak:)
//                            toClass:appendReplaceController
//                          fromClass:Override_OSX.class];
//    [EPPZSwizzler addClassMethod:@selector(makeItemForIdentifier:)
//                            toClass:appendReplaceController
//                          fromClass:Override_OSX.class];
        result = 1;
    }
    @catch(NSException *exception)
    {
        
    }
    
    return result;
}

+(void)replaceAppDelegateMethod:(SEL) unitySelector
                      fromClass:(Class) overrideAppDelegate
               savingOriginalTo:(SEL) savingOriginalSelector
{
    // The Unity base app controller class (the class name stored in `AppControllerClassName`).
    Class unityAppDelegate = NSClassFromString(@"EditorApplicationPrincipalClass");
    
    // See log messages for the sake of this tutorial.
    [EPPZSwizzler setLogging:YES];
    
    // Add empty placholder to Unity app delegate.
    [EPPZSwizzler addInstanceMethod:savingOriginalSelector
                            toClass:unityAppDelegate
                          fromClass:overrideAppDelegate];
    
    // Save the original Unity app delegate implementation into.
    [EPPZSwizzler swapInstanceMethod:savingOriginalSelector
                  withInstanceMethod:unitySelector
                             ofClass:unityAppDelegate];
    
    // Replace Unity app delegate with ours.
    [EPPZSwizzler replaceInstanceMethod:unitySelector
                                ofClass:unityAppDelegate
                              fromClass:overrideAppDelegate];
}

@end
