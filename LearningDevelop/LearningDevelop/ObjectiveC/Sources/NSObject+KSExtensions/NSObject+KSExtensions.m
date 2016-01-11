
#import "NSObject+KSExtensions.h"

@implementation NSObject (KSExtensions)

+(instancetype)object {
    return [[[self alloc] init] autorelease];
}

@end
