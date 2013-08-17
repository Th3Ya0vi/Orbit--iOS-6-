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
#import "OrbitTransitionHandler.h"

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
        
        // initialize the orbit properties
        self.orbitDistance = 40.0f;
        self.lowestOrbit = 40.0f;
        self.highestOrbit = 120.0f;
        
        // set the player's orbital distance to the orbit distance
        self.player.orbitalDistance = self.orbitDistance;
        
        // add the player and the orb to this layer
        [self addChild:[self.orb sprite] z:0]; // the orb has a z of 0
        [self addChild:[self.player sprite] z:1]; // the player has a z of 1
        
        // set touch enabled so we can switch orbits
        [self setTouchEnabled:YES];
        
        // calls update: every frame
        [self scheduleUpdate];
    }
    return self;
}

+ (float)orbitDistance {
    return 40.0f;
}

- (void)update:(ccTime)delta {
    [self.player update:delta];
    [[OrbitTransitionHandler sharedOrbitTransitionHandler] updateAnimationForAllObjectsInPool];
}

// the player touched the screen
- (void)ccTouchesBegan:(NSSet *)touches
             withEvent:(UIEvent *)event {
    
    // only get one of the touches
    UITouch *touch = [touches anyObject];
    // get the touch's location in node space
    CGPoint touchLocation = [self convertToNodeSpace:[touch locationInView:[touch view]]];
    
    // check to see if we need to move up or down an orbit
    if (touchLocation.x >= CENTER_POINT.x) {
        // move up an orbit
        [self.player moveUpOrbit];
    } else {
        // move down an orbit
    }
}

// return an array of orbit values, each orbit is 40 pixels wide, with a 4 pixel buffer in between
// currently there are 3 orbits at 80, 124 and 168
// [36])  [4] [40]  [4]  [40]   [4]  [40]
// [36]) [40] [80] [84] [124] [128] [168]
// this means the player needs to orbit at 82, 126 and 170, so that's what this array returns
+ (NSArray *)getOrbitingRadii {
    return @[@(82), @(126), @(170)];
}

#pragma mark - Z Order
// Z(0): Orb
// Z(1): Player

@end
