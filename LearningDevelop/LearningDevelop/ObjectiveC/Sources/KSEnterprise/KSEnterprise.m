
#import "NSObject+KSExtensions.h"
#import "KSEnterprise.h"
#import "KSCar.h"
#import "KSWasher.h"
#import "KSAccountant.h"
#import "KSDirector.h"
#import "KSQueue.h"
#import "KSEmployeeProtocol.h"
#import "KSEmployee.h"

@interface KSEnterprise () <KSEmployeeProtocol>
@property (nonatomic, retain) NSMutableArray    *mutableStaff;
@property (nonatomic, retain) KSQueue           *carsQueue;

- (void)hireBasicTeam;
- (void)fireBasicTeam;
- (void)addEmployees:(NSArray *)employees withObservers:(NSArray *)observers; 
- (void)addEmployee:(KSEmployee *)employee withObservers:(NSArray *)observers;
- (id)findFreeEmployee:(Class)class;
- (void)performNextCar:(KSWasher *)washer;

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
        KSWasher *washer = [self findFreeEmployee:[KSWasher class]];
        if (washer) {
            [washer performWorkWithObject:car];
        } else {
            [self.carsQueue enqueue:car];
        }
    }
}

#pragma mark -
#pragma mark Private

- (void)hireBasicTeam {
    KSAccountant *accountant = [KSAccountant object];
    KSDirector *director = [KSDirector object];
    
    [self addEmployees:@[[KSWasher object],[KSWasher object]] withObservers:@[accountant, self]];
    [self addEmployee:accountant withObservers:@[self, director]];
    [self addEmployee:director withObservers:nil];

}

- (void)fireBasicTeam {
    NSMutableArray *staff = self.mutableStaff;
    for (KSEmployee *employee in staff) {
        [employee removeObserver:self];
        [employee removeObserversFromArray:staff];
    }
}

- (void)addEmployees:(NSArray *)employees withObservers:(NSArray *)observers {
    for (KSEmployee *employee in employees) {
        [self addEmployee:employee withObservers:observers];
    }
}

- (void)addEmployee:(KSEmployee *)employee withObservers:(NSArray *)observers {
    for (id observer in observers) {
        [employee addObserver:observer];
    }
    
    [self.mutableStaff addObject:employee];
}

- (id)findFreeEmployee:(Class)class {
    for (KSEmployee *employee in self.staff) {
        if ([employee isMemberOfClass:class] && employee.state == kKSEmployeeDidBecomeFree) {
            
            return employee;
        }
    }
    
    return nil;
}

- (void)performNextCar:(KSWasher *)washer {
    KSCar *car = [[self carsQueue] dequeue];
    if (car) {
        [washer performWorkWithObject:car];
    }
}

#pragma mark -
#pragma mark KSEmployeeProtocol

- (void)employeeDidBecomeFree:(KSWasher *)employee {
    [self performNextCar:employee];
}

@end
