//
//  Entity.h
//  Orbit
//
//  Created by Hamdan Javeed on 2013-08-17.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//
//  Something in the game that requires an orbit handling system. The Player is an entity.

#import <Foundation/Foundation.h>

// --------------------------------------------------------------------- //
// What an Entity should declare in its header file:                     //
//  - a method to get its sprite called    - (CCSprite *)sprite;         //
//  - a method to update the entity called - (void)update:(ccTime)delta; //
// --------------------------------------------------------------------- //

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

// the entity's sprite (contains the sprite image, position, rotation)
@property (nonatomic) CCSprite *sprite;

// the entity's angle relative to the orb, think of the player on a cartesian grid, right would be 0π radians increasing counter-clockwise
@property (nonatomic) float angleRelativeToOrb;

// the radius of the entity's orbit
@property (nonatomic) float orbitalRadius;

// the pixels per second that the entity travels
@property (nonatomic) float pixelsPerSecond;

// a number that describes how quickly the entity transitions from orbits (pixels per second)
@property (nonatomic) float orbitTransitionRate;

// updates the entity's position and rotation
- (void)update:(ccTime)delta;
@end
