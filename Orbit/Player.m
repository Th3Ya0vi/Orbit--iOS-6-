//
//  Player.m
//  Orbit
//
//  Created by Hamdan Javeed on 2013-08-15.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import "Player.h"
#import "GameplayLayer.h"

@implementation Player

// initialize the player
- (id)init {
    self = [super init];
    if (self) {
        // initialize the sprite and center it
        self.sprite = [CCSprite spriteWithFile:@"Player.png"];
        self.sprite.position = CENTER_POINT;
        
        // set the orbitalIndex, and reset the orbitalRadius
        self.orbitIndex = 1;
        self.orbitalRadius = [(NSNumber *)[[GameplayLayer getPossibleOrbits] objectAtIndex:self.orbitIndex] floatValue];
    }
    return self;
}

@end
