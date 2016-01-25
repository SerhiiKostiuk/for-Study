
#import "NSObject+KSExtensions.h"

@implementation NSObject (KSExtensions)

+ (instancetype)object {
    return [[[self alloc] init] autorelease];
}


+ (NSArray *)objectsWithCount:(NSUInteger)count {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:count];
    for (NSUInteger index = 0; index < count; index++) {
        [result addObject: [self object]];
    }
    
    return  [[result copy] autorelease];
}

@end
