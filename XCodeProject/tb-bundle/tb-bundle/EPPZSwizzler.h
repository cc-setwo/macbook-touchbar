// Murka Co.

#import <Foundation/Foundation.h>
#import <objc/runtime.h>


typedef enum
{
    assign = OBJC_ASSOCIATION_ASSIGN,
    nonatomic_retain = OBJC_ASSOCIATION_RETAIN_NONATOMIC,
    nonatomic_copy = OBJC_ASSOCIATION_COPY_NONATOMIC,
    retain = OBJC_ASSOCIATION_RETAIN,
    copy = OBJC_ASSOCIATION_COPY
} EPPZSwizzlerProperryAssociationPolicy;


@interface EPPZSwizzler : NSObject


#pragma mark - Logging


/*! Toggle swizzling logs. */
+(void)setLogging:(BOOL) isOn;

/*! Used for unit testing. */
+(NSString*)latestErrorMessage;


#pragma mark - Method swizzlers


/*!
 
 Swaps instance method implementations.
 
 @param oneSelector A selector to swap its implementation.
 @param otherSelector Another selector to swap implementation with.
 @param class The class to operate on.
 
 */
+(void)swapInstanceMethod:(SEL) oneSelector
       withInstanceMethod:(SEL) otherSelector
                  ofClass:(Class) _class;


/*!
 
 Swaps class method implementations.
 
 @param oneSelector A selector to swap its implementation.
 @param otherSelector Another selector to swap implementation with.
 @param class The class to operate on.
 
 */
+(void)swapClassMethod:(SEL) oneSelector
       withClassMethod:(SEL) otherSelector
               ofClass:(Class) _class;


/*!
 
 Replace class method implementation with implementation
 picked from another class (for the same method). Does nothing
 if the method is not implemented already on the target class.
 
 @param selector Selector to replace in target class, and to look for in source class.
 @param targetClass Class to operate on.
 @param sourceClass Class the implementation is picked from.
 
 */
+(void)replaceClassMethod:(SEL) selector
                  ofClass:(Class) targetClass
                fromClass:(Class) sourceClass;


/*!
 
 Replace instance method implementation with implementation
 picked from another class (for the same method). Does nothing
 if the method is not implemented already on the target class.
 
 @param selector Selector to replace in target class, and to look for in source class.
 @param targetClass Class to operate on.
 @param sourceClass Class the implementation is picked from.
 
 */
+(void)replaceInstanceMethod:(SEL) selector
                     ofClass:(Class) targetClass
                   fromClass:(Class) sourceClass;


/*!
 
 Add class method implementation with implementation
 picked from another class (for the same method). Does
 nothing if the method already exist on the target class.
 
 @param selector Selector to replace in target class, and to look for in source class.
 @param targetClass Class to operate on.
 @param sourceClass Class the implementation is picked from.
 
 */
+(void)addClassMethod:(SEL) selector
              toClass:(Class) targetClass
            fromClass:(Class) sourceClass;


/*!
 
 Add instance method implementation with implementation
 picked from another class (for the same method). Does
 nothing if the method already exist on the target class.
 
 @param selector Selector to replace in target class, and to look for in source class.
 @param targetClass Class to operate on.
 @param sourceClass Class the implementation is picked from.
 
 */
+(void)addInstanceMethod:(SEL) selector
                 toClass:(Class) targetClass
               fromClass:(Class) sourceClass;


#pragma mark - Property swizzlers


/*!
 
 Add property picked from another class (for the same method).
 Does nothing if the method already exist on the target class.
 
 @param propertyName Name of the property to look for in source class.
 @param targetClass Class to operate on.
 @param sourceClass Class the property is picked from.
 
 */
+(void)addPropertyNamed:(NSString*) propertyName
                toClass:(Class) targetClass
              fromClass:(Class) sourceClass;


/*!
 
 Creates (synthesizes) a property for the given class with the
 given properties.
 
 As it uses associated object API under the hood, you can only
 synthesize object properties (for now).
 
 To preserve IDE consistency, you may define
 the property in the class interface, or in a category for class,
 then mark property as \@dynamic in the implementation (like
 Core Data NSManagedObject properties).
 
 @param propertyName Name for the property to be created.
 @param kind Class to represent the kind of the property to be created.
 @param targetClass Class to operate on.
 
 */
+(void)synthesizePropertyNamed:(NSString*) propertyName
                        ofKind:(Class) kind
                      forClass:(Class) targetClass
                    withPolicy:(EPPZSwizzlerProperryAssociationPolicy) policy;


@end
