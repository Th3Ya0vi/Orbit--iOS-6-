//
//  MenuOptionsLayer.m
//  Orbit
//
//  Created by Hamdan Developer on 8/13/13.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//
//  Contains a CCSprite that is centered on the screen.

#import "MenuOptionsLayer.h"

@implementation MenuOptionsLayer

// create a sprite that is some random image (ie. the icon) and display it (for debugging purposes)
- (id)init {
    self = [super init];
    if (self) {
        CCSprite *testIconSprite = [CCSprite spriteWithFile:@"Icon.png"];
        
        CGSize windowSize = [[CCDirector sharedDirector] winSize];
        testIconSprite.position = CGPointMake(windowSize.width / 2.0f, windowSize.height / 2.0f);
        
        [self addChild:testIconSprite];
    }
    return self;
}

@end
