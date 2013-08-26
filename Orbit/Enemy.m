//
//  Enemy.m
//  Orbit
//
//  Created by Hamdan Javeed on 2013-08-19.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import "Enemy.h"

@interface Enemy ()
@property (nonatomic) int targetOrbitIndex;
@property (nonatomic) float life;
@property (nonatomic, getter = isDespawning) BOOL despawning;
@end

@implementation Enemy

// initialize the enemy with a targetOrbitIndex
- (id)initWithTargetOrbitIndex:(int)targetOrbitIndex
                          layer:(CCLayer *)layer {
    self = [super init];
    if (self) {
        // set the sprite and center it
        self.sprite = [CCSprite spriteWithFile:@"Enemy.png"];
        self.sprite.position = CENTER_POINT;
        
        self.targetOrbitIndex = targetOrbitIndex;
        
        self.orbitTransitionRate = 100.0f;
        
        self.angleRelativeToOrb = (arc4random() % 629) / 100.0f;
        
        [layer addChild:self.sprite z:48];
    }
    return self;
}

#define MAX_LIFE 5.0f
#define DESPAWN_TRANSITION_RATE_MODIFIER 1.5f

- (void)update:(ccTime)delta {
    [super update:delta];
    
    // increase our life by delta
    self.life += delta;
    
    // if our life is over, then set despawning to YES
    if (self.life > MAX_LIFE) {
        self.despawning = YES;
    }
    
    // if we are in the process of despawning
    if (self.isDespawning) {
        self.orbitalRadius += self.orbitTransitionRate * 1.5f * delta;
    }
    
    // if we are orbiting and have not yet reached our target orbit index, set our state to transition up
    if (self.state == OrbitState && self.orbitIndex != self.targetOrbitIndex) {
        self.state = TransitionUpState;
    }
}

@end
