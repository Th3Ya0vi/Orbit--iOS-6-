//
//  Player.m
//  Orbit
//
//  Created by Hamdan Javeed on 2013-08-15.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import "Player.h"

@interface Player ()
// the player's sprite (contains the sprite image, position, rotation)
@property (nonatomic) CCSprite *sprite;
@end

@implementation Player

// initialize the player
- (id)init {
    self = [super init];
    if (self) {
        // initialize the sprite and center it
        self.sprite = [CCSprite spriteWithFile:@"Player.png"];
        self.sprite.position = CENTER_POINT;
    }
    return self;
}

@end
