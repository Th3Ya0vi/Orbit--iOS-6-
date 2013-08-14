//
//  MainMenuScene.m
//  Orbit
//
//  Created by Hamdan Developer on 8/13/13.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import "MainMenuScene.h"
#import "MenuOptionsLayer.h"

@implementation MainMenuScene

- (id)init {
    self = [super init];
    if (self) {
        MenuOptionsLayer *menuOptionsLayer = [MenuOptionsLayer node];
        [self addChild:menuOptionsLayer];
    }
    return self;
}

@end
