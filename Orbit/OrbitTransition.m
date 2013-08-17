//
//  OrbitTransition.m
//  Orbit
//
//  Created by Hamdan Javeed on 2013-08-16.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import "OrbitTransition.h"

@implementation OrbitTransition

- (id)initWithPlayer:(Player *)player
      departureOrbit:(float)departureOrbit
        arrivalOrbit:(float)arrivalOrbit {
    
    self = [super init];
    if (self) {
        self.player = player;
        self.departureOrbit = departureOrbit;
        self.arrivalOrbit = arrivalOrbit;
    }
    return self;
}

@end
