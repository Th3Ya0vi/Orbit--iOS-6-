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

// return an array of orbit values, each orbit is 40 pixels wide, with a 4 pixel buffer in between
// currently there are 3 orbits at 80, 124 and 168
// [36])  [4] [40]  [4]  [40]   [4]  [40]
// [36]) [40] [80] [84] [124] [128] [168]
// this means the player needs to orbit at 82, 126 and 170, so that's what this array returns
+ (NSArray *)getOrbitingRadii;

// orbit properties
@property (nonatomic) float orbitDistance;
@property (nonatomic) float lowestOrbit;
@property (nonatomic) float highestOrbit;

+ (float)orbitDistance;
@end
