//
//  GameplayLayer.m
//  Orbit
//
//  Created by Hamdan Javeed on 2013-08-15.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//
//  The layer that is the game.

#import "GameplayLayer.h"
#import "Player.h"
#import "Orb.h"

@interface GameplayLayer ()
// the player
@property (nonatomic) Player *player;
// the orb
@property (nonatomic) Orb *orb;
@end

@implementation GameplayLayer

// return this layer encapsulated in a CCScene (needed for transitions)
+ (CCScene *)scene {
    CCScene *scene = [CCScene node];
    [scene addChild:[GameplayLayer node]];
    return scene;
}

// initialize layer
- (id)init {
    self = [super init];
    if (self) {
        // initialize player property
        self.player = [[Player alloc] init];
        
        // initialize the orb
        self.orb = [[Orb alloc] init];
        
        // add the player and the orb to this layer
        [self addChild:[self.orb sprite] z:0]; // the orb has a z of 0
        [self addChild:[self.player sprite] z:1]; // the player has a z of 1
        
        // calls update: every frame
        [self scheduleUpdate];
    }
    return self;
}

- (void)update:(ccTime)delta {
    [self.player update:delta];
}

#pragma mark - Z Order
// Z(0): Orb
// Z(1): Player

@end
