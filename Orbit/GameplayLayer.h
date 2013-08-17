//
//  GameplayLayer.h
//  Orbit
//
//  Created by Hamdan Javeed on 2013-08-15.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//
//  The layer that is the game.

#import "CCLayer.h"

@interface GameplayLayer : CCLayer
// return this layer encapsulated in a CCScene (needed for transitions)
+ (CCScene *)scene;

// get an array of possible orbits
+ (NSArray *)getPossibleOrbits;
@end
