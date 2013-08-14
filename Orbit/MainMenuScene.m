//
//  MainMenuScene.m
//  Orbit
//
//  Created by Hamdan Developer on 8/13/13.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//
//  The screen that the user initially sees. Right now it has a MenuOptionsLayer and displays
//  an icon.

#import "MainMenuScene.h"
#import "MenuOptionsLayer.h"

@implementation MainMenuScene

// create the menuOptionsLayer and add it as a child
- (id)init {
    self = [super init];
    if (self) {
        MenuOptionsLayer *menuOptionsLayer = [MenuOptionsLayer node];
        [self addChild:menuOptionsLayer];
    }
    return self;
}

@end
