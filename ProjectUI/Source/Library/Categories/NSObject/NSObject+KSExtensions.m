
#import "NSObject+KSExtensions.h"

@implementation NSObject (KSExtensions)

+ (instancetype)object {
    return [[self alloc] init];
}


+ (NSArray *)objectsWithCount:(NSUInteger)count {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:count];
    for (NSUInteger index = 0; index < count; index++) {
        [result addObject: [self object]];
    }
    
    return  [result copy];
}

@end
