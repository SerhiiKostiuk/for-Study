
#import "KSQueue.h"

@interface KSQueue ()
@property (nonatomic, retain) NSMutableArray *mutableItems;

@end

@implementation KSQueue
@dynamic items;

#pragma mark-
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableItems = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableItems = [NSMutableArray array];
    }
    return self;
}

#pragma mark-
#pragma mark Accessors

- (NSArray *)items {
    return [[self.mutableItems copy] autorelease];
}

#pragma mark-
#pragma mark Public

- (void)enqueue:(id)object {
    [self.mutableItems addObject:object];
}

- (id)dequeue {
    NSMutableArray *items = self.mutableItems;
    id object = nil;
    object = [items lastObject];
    
    if (object) {
        [[object retain] autorelease];
        [items removeObject:object];
    }
    
    return object;
}

@end
