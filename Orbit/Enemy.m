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

- (void)update:(ccTime)delta {
    [super update:delta];
    
    // if we are orbiting and have not yet reached our target orbit index, set our state to transition up
    if (self.state == OrbitState && self.orbitIndex != self.targetOrbitIndex) {
        self.state = TransitionUpState;
    }
}

@end
