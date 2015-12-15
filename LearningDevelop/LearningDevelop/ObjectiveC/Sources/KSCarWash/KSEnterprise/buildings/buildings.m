//
//  buildings.m
//  LearningDevelop
//
//  Created by Serg Bla on 12.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "rooms.h"
#import "buildings.h"
#import "employee.h"
#import "containerForItems.h"

static const NSUInteger kDefaultRoomCapacity = 2;

@interface buildings ()
@property (nonatomic, retain) NSMutableArray *mutableRooms;

@end

@implementation buildings
@dynamic rooms;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)building {
    return [[self alloc] initWithRooms:[NSArray arrayWithObject:[rooms roomWithCapacity:kDefaultRoomCapacity]]];
}

+ (instancetype)buildingWithRooms:(NSArray *)rooms {
    return  [[self alloc] initWithRooms:rooms];
}

+ (BOOL)canContainItemOfClass:(Class)itemClass {
    return [itemClass isSubclassOfClass:[employee class]];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableRooms = nil;
    
    [super dealloc];
}

- (instancetype)initWithRooms:(NSArray *)rooms {
    self =[self init];
    if (self) {
        for (id room in rooms) {
            [[self mutableRooms] addObject:room];
        }
    }
    return self;
}

#pragma mark -
#pragma mark Accessors

-(NSArray *)rooms {
    return [[_mutableRooms copy] autorelease];
}

#pragma mark -
#pragma mark Public

- (void)addRoom:(id)room {
    [self.mutableRooms addObject:room];
}

- (void)removeRoom:(id)room {
    for (id employee in [[room staff] items] ) {
        [room removeEmployee:employee];
    }
    
    [self.mutableRooms removeObject:room];
}

@end
