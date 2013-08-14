//
//  GameplayScene.m
//  Orbit
//
//  Created by Hamdan Developer on 8/13/13.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//
//  The scene that contains the gameplay layers. This scene is the game.
//  It draws the icon for debugging purposes.

#import "GameplayScene.h"

@implementation GameplayScene

// create an icon sprite and add it as a child
- (id)init {
    self = [super init];
    if (self) {
        CCSprite *tempIconSprite = [CCSprite spriteWithFile:@"Icon.png"];
        
        CGSize windowSize = [[CCDirector sharedDirector] winSize];
        tempIconSprite.position = CGPointMake(windowSize.width / 2.0f, windowSize.height / 2.0f);
        
        [self addChild:tempIconSprite];
    }
    return self;
}

@end
