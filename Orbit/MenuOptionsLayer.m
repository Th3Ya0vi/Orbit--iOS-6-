//
//  MenuOptionsLayer.m
//  Orbit
//
//  Created by Hamdan Developer on 8/13/13.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import "MenuOptionsLayer.h"

@implementation MenuOptionsLayer

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
