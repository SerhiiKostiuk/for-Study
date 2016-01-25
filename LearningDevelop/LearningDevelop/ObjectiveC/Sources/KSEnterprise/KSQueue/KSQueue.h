#import <Foundation/Foundation.h>

@interface KSQueue : NSObject
@property (nonatomic, readonly) NSArray *items;

- (void)enqueue:(id)object;
- (id)dequeue;

@end
