//
//  MainMenuScene.m
//  Orbit
//
//  Created by Hamdan Javeed on 8/13/13.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//
//  The screen that the user initially sees. Has a Menu object that has a Play button.
//  The play button transitions to the game.

#import "MainMenuScene.h"
#import "Menu.h"

@implementation MainMenuScene

// create the menu and add it as a child
- (id)init {
    self = [super init];
    if (self) {
        Menu *menu = [[Menu alloc] init];
        [self addChild:menu];
    }
    return self;
}

@end
