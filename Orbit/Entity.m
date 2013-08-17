//
//  Entity.m
//  Orbit
//
//  Created by Hamdan Javeed on 2013-08-17.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//
//  Something in the game that moves. The Player is an entity.

#import "Entity.h"

@implementation Entity

- (id)init {
    self = [super init];
    if (self) {
        // set our initial state to OrbitState
        self.state = OrbitState;
        
        // set our orbit index to 0
        self.orbitIndex = 0;
    }
    return self;
}

@end
