//
//  Menu.m
//  Orbit
//
//  Created by Hamdan Developer on 8/13/13.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//
//  A menu that has a play button.

#import "Menu.h"

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

// logs to console when called
- (void)playGame {
    NSLog(@"Game is playing");
}

@end
