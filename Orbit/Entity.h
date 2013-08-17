//
//  Entity.h
//  Orbit
//
//  Created by Hamdan Javeed on 2013-08-17.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//
//  Something in the game that requires an orbit handling system. The Player is an entity.

#import <Foundation/Foundation.h>

// an enum that defines the possible states of an entity
typedef NS_ENUM(NSUInteger, EntityState) {
    OrbitState,
    TransitionUpState,
    TransitionDownState
};

@interface Entity : NSObject
// the current orbit index (eg. 0, 1, 2 ...)
@property (nonatomic) int orbitIndex;

// the current state of the entity
@property (nonatomic) EntityState state;
@end
