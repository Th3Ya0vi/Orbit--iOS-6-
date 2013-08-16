//
//  Player.h
//  Orbit
//
//  Created by Hamdan Javeed on 2013-08-15.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject
// returns the player's sprite
- (CCSprite *)sprite;

// updates the player's position and rotation
- (void)update:(ccTime)delta;

// the direction the player is currently moving in in the y direction
// -1: down
//  0: stationary
//  1: up
@property (nonatomic) int currentYDirection;

@end
