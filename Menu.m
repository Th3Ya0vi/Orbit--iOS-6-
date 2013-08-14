//
//  Menu.m
//  Orbit
//
//  Created by Hamdan Developer on 8/13/13.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//
//  A menu that has a play button which transitions to the game.

#import "Menu.h"
#import "GameplayScene.h"

@implementation Menu

// add a play button
- (id)init {
    self = [super init];
    if (self) {
        // create a play button that calls playGame when pressed
        CCMenuItemLabel *playButton = [[CCMenuItemLabel alloc] initWithLabel:[CCLabelTTF labelWithString:@"Play" fontName:@"Zapfino" fontSize:48]
                                                                      target:self
                                                                    selector:@selector(playGame)];
        [self addChild:playButton];
    }
    return self;
}

// transitions to the GameplayScene
- (void)playGame {
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[GameplayScene node]]];
}

@end
