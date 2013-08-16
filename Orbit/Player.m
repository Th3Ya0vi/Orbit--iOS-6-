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

// the player's angle relative to the orb, think of the player on a cartesian grid, right would be 0π radians increasing counter-clockwise
@property (nonatomic) float angleRelativeToOrb;

// the radius of the player's orbit
@property (nonatomic) float orbitalDistance;
@end

@implementation Player

// initialize the player
- (id)init {
    self = [super init];
    if (self) {
        // initialize the sprite and center it
        self.sprite = [CCSprite spriteWithFile:@"Player.png"];
        self.sprite.position = CGPointMake(CENTER_POINT.x + 50, CENTER_POINT.y);
        
        self.angleRelativeToOrb = 0.0f;
        self.orbitalDistance = 50.0f;
    }
    return self;
}

// updates the player's position and rotation
- (void)update:(ccTime)delta {
    // increase the angle by 0.1
    self.angleRelativeToOrb += 0.1;
    
    // now that the angle has changed, we need to reset the position and rotation of the sprite
    // get the new position by cos/sin -ing and then multiplying by the orbitalDistance, then adding the center point
    float newPositionX = cosf(self.angleRelativeToOrb) * self.orbitalDistance + CENTER_POINT.x;
    float newPositionY = sinf(self.angleRelativeToOrb) * self.orbitalDistance + CENTER_POINT.y;
    // set the sprites position
    self.sprite.position = CGPointMake(newPositionX, newPositionY);
    
    // set the sprite's rotation by converting the angleRelativeToOrb to degrees
    self.sprite.rotation = -self.angleRelativeToOrb * (180.0f / M_PI);
}

@end
