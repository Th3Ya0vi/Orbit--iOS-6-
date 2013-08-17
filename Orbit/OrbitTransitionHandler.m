//
//  OrbitTransitionHandler.m
//  Orbit
//
//  Created by Hamdan Javeed on 2013-08-16.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import "OrbitTransitionHandler.h"
#import "GameplayLayer.h"
#import "OrbitTransition.h"

@interface OrbitTransitionHandler ()
@property (nonatomic) NSMutableSet *pool;
@end

@implementation OrbitTransitionHandler

+ (OrbitTransitionHandler *)sharedOrbitTransitionHandler {
    static OrbitTransitionHandler *orbitTransitionHandler = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        orbitTransitionHandler = [[self alloc] init];
    });
    return orbitTransitionHandler;
}

- (void)animateOrbitTransitionUpForPlayer:(Player *)player {
    OrbitTransition *ot = [[OrbitTransition alloc] initWithPlayer:player
                                                   departureOrbit:player.orbitalDistance
                                                     arrivalOrbit:player.orbitalDistance + [GameplayLayer orbitDistance]];
    if (![self.pool containsObject:ot]) {
        [self.pool addObject:ot];
    }
}

- (void)updateAnimationForAllObjectsInPool {
    NSEnumerator *e = [self.pool objectEnumerator];
    OrbitTransition *ot;
    while ((ot = [e nextObject]) != nil) {
        // reached goal orbit
        if (ot.player.orbitalDistance - ot.departureOrbit >= 40.0f) {
            ot.player.orbitalDistance = ot.arrivalOrbit;
            [self.pool removeObject:ot];
        }
        
        // need to animate
        ot.player.orbitalDistance += 0.1f;
    }
}

- (id)init {
    self = [super init];
    if (self) {
        self.pool = [[NSMutableSet alloc] init];
    }
    return self;
}

@end
