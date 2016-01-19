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
    @synchronized(self.mutableItems) {
        return [[self.mutableItems copy] autorelease];
    }
}

#pragma mark-
#pragma mark Public

- (void)enqueue:(id)object {
    @synchronized(self) {
        [self.mutableItems addObject:object];
    }
}

- (id)dequeue {
    @synchronized(self) {
        id object = [self.items firstObject];
        
        if (object) {
            [[object retain] autorelease];
            [self.mutableItems removeObject:object];
        }
        
        return object;
    }
}

@end
