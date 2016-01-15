
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
@property (nonatomic, retain) NSMutableArray *mutableStaff;
@property (nonatomic, retain) KSQueue *carsQueue;

@end

@implementation KSEnterprise

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
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
        KSAccountant *accountant = [self findFreeEmployee:[KSAccountant class]];
        KSDirector *director = [self findFreeEmployee:[KSDirector class]];
        if (washer && accountant && director) {
            [washer performWorkWithObject:car];
            [accountant performWorkWithObject:washer];
            [director performWorkWithObject:accountant];
        }
    }
}


#pragma mark -
#pragma mark Private

- (void)hireBasicTeam {
    NSMutableArray *team = self.mutableStaff;
    NSArray *staff = @[[KSWasher object], [KSWasher object], [KSAccountant object], [KSDirector object]];
    
    for (id employee in staff) {
        [(KSWasher *)employee addObserver:(KSAccountant *)employee];
        [employee addObserver:self];
        [team addObject:employee];
    }
}


- (id) findFreeEmployee:(Class)class {
    for (KSEmployee *employee in self.staff) {
        if ([employee isMemberOfClass:class] && kKSEmployeeDidBecomeFree == [employee state]) {
            
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
