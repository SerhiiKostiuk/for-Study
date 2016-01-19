
#import "NSObject+KSExtensions.h"
#import "KSEnterprise.h"
#import "KSCar.h"
#import "KSWasher.h"
#import "KSAccountant.h"
#import "KSDirector.h"
#import "KSQueue.h"
#import "KSEmployeeProtocol.h"
#import "KSEmployee.h"
#import "KSDispatcher.h"
static const NSUInteger kKSDefaultWasherCount = 3;
static const NSUInteger kKSDefaultAccountantCount = 2;
static const NSUInteger kKSDefaultDirectorCount = 1;

@interface KSEnterprise ()
@property (nonatomic, retain) KSDispatcher   *washersDispatcher;
@property (nonatomic, retain) KSDispatcher   *accountantsDispatcher;
@property (nonatomic, retain) KSDispatcher   *directorsDispatcher;
@property (nonatomic, retain) KSQueue        *carsQueue;
@property (nonatomic, retain) NSMutableArray *mutableStaff;

- (void)hireBasicTeam;
- (void)fireBasicTeam;
- (void)addEmployees:(NSArray *)employees withDispatcher:(KSDispatcher *)dispatcher;

@end

@implementation KSEnterprise

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self fireBasicTeam];
    
    self.mutableStaff = nil;
    self.carsQueue = nil;
   
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.washersDispatcher = [KSDispatcher object];
        self.accountantsDispatcher = [KSDispatcher object];
        self.directorsDispatcher = [KSDispatcher object];
        self.mutableStaff = [NSMutableArray array];
        self.carsQueue = [KSQueue object];
        
        [self hireBasicTeam];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)staff {
    return [[self.mutableStaff copy] autorelease];
}

#pragma mark -
#pragma mark Public

- (void)washCars:(NSArray *)cars {
    for (KSCar *car in cars) {
        [self.washersDispatcher performWorkWithObject:car];
    }
}

#pragma mark -
#pragma mark Private

- (void)hireBasicTeam {
    NSArray *washers = [KSWasher objectsWithCount:kKSDefaultWasherCount];
    NSArray *accountants = [KSAccountant objectsWithCount:kKSDefaultAccountantCount];
    NSArray *directors = [KSDirector objectsWithCount:kKSDefaultDirectorCount];
    
    [self addEmployees:washers withDispatcher:self.washersDispatcher];
    [self addEmployees:accountants withDispatcher:self.accountantsDispatcher];
    [self addEmployees:directors withDispatcher:self.directorsDispatcher];
}

- (void)fireBasicTeam {
    NSArray *observers = @[self, self.washersDispatcher, self.accountantsDispatcher, self.directorsDispatcher];
    for (KSEmployee *employee in self.mutableStaff) {
        [employee removeObserversFromArray:observers];
    }
}

- (void)addEmployees:(NSArray *)employees withDispatcher:(KSDispatcher *)dispatcher {
    NSArray *observers = @[self, dispatcher];
    
    for (KSEmployee *employee in employees) {
        [dispatcher addHandler:employee];
        [self.mutableStaff addObject:employee];
        [employee addObserversFromArray:observers];
    }
}

@end
