//
//  Orb.m
//  Orbit
//
//  Created by Hamdan Javeed on 2013-08-15.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//
//  The orb.

#import "Orb.h"

@interface Orb ()
// the sprite of the orb (contains image, position)
@property (nonatomic) CCSprite *sprite;
@end

@implementation Orb

// initialize the sprite
- (id)init {
    self = [super init];
    if (self) {
        self.sprite = [CCSprite spriteWithFile:@"Orb.png"];
        self.sprite.position = CENTER_POINT;
    }
    return self;
}

@end
