//
//  buildings.m
//  LearningDevelop
//
//  Created by Serg Bla on 12.12.15.
//  Copyright © 2015 Serg Bla. All rights reserved.
//

#import "KSRooms.h"
#import "KSBuildings.h"
#import "KSEmployee.h"
#import "KSItemsContainer.h"

static const NSUInteger kDefaultRoomCapacity = 2;

@interface KSBuildings ()
@property (nonatomic, retain) KSItemsContainer *mutableRooms;

@end

@implementation KSBuildings
@dynamic rooms;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)building {
    return [[self alloc] initWithRooms:[NSArray arrayWithObject:[KSRooms roomWithCapacity:kDefaultRoomCapacity]]];
}

+ (instancetype)buildingWithRooms:(NSArray *)rooms {
    return  [[self alloc] initWithRooms:rooms];
}

//+ (BOOL)canContainItemOfClass:(Class)itemClass {
//    return [itemClass isSubclassOfClass:[KSEmployee class]];
//}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableRooms = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [self initWithRooms:nil];
    
    return self;
}

- (instancetype)initWithRooms:(NSArray *)rooms {
    self =[super init];
    
    self.mutableRooms = [[[KSItemsContainer alloc]initWithCapacity:rooms.count] autorelease];
    for (KSRooms *room in rooms) {
        [self addRoom:room];
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
    [self.mutableRooms addItems:room];
}

- (void)removeRoom:(id)room {
    for (id employee in [[room staff] items] ) {
        [room removeEmployee:employee];
    }
    
    [self.mutableRooms removeItems:room];
}

- (NSArray *)roomsOfClass:(Class)roomClass {
    return [self.mutableRooms itemsOfClass:roomClass];
}

@end
