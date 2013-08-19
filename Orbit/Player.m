//
//  Player.m
//  Orbit
//
//  Created by Hamdan Javeed on 2013-08-15.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import "Player.h"
#import "Entity.h"
#import "GameplayLayer.h"

@interface Player ()
// the player's sprite (contains the sprite image, position, rotation)
@property (nonatomic) CCSprite *sprite;

// the player's angle relative to the orb, think of the player on a cartesian grid, right would be 0π radians increasing counter-clockwise
@property (nonatomic) float angleRelativeToOrb;

// the radius of the player's orbit
@property (nonatomic) float orbitalRadius;

// the pixels per second that the player travels
@property (nonatomic) float pixelsPerSecond;

// a number that describes how quickly the player transitions from orbits (pixels per second)
@property (nonatomic) float orbitTransitionRate;
@end

@implementation Player

// initialize the player
- (id)init {
    self = [super init];
    if (self) {
        // initialize the sprite and center it
        self.sprite = [CCSprite spriteWithFile:@"Player.png"];
        self.sprite.position = CGPointMake(CENTER_POINT.x + 50, CENTER_POINT.y);
        
        // the initial angle
        self.angleRelativeToOrb = 0.0f;
        
        // set our orbit index to 1 (note: this needs to be set before orbitalRadius)
        self.orbitIndex = 1;
        
        // how far away the player is from the orb
        self.orbitalRadius = [(NSNumber *)[[GameplayLayer getPossibleOrbits] objectAtIndex:self.orbitIndex] floatValue];
        
        // how many pixels the player travels per second
        self.pixelsPerSecond = 300.0f;
        
        // how quickly the player transitions from orbits
        self.orbitTransitionRate = 300.0f;
    }
    return self;
}

// updates the player's position and rotation
- (void)update:(ccTime)delta {
    [self increaseAngleRelativeToOrbWithDelta:delta];
    [self adjustOrbitalDistanceWithDelta:delta];
    [self setPositionWithDelta:delta];
    [self setRotationWithDelta:delta];
}

- (void)increaseAngleRelativeToOrbWithDelta:(ccTime)delta {
    // s(arc length) = r(radius) * ∂(angle: radians)
    // ∂ = s ÷ r
    // angleRelaviteToOrb = pixelsPerSecond ÷ orbitalRadius
    
    // increase the angle by pixelsPerSecond ÷ orbitalRadius * delta
    self.angleRelativeToOrb += self.pixelsPerSecond / self.orbitalRadius * delta;
}

- (void)adjustOrbitalDistanceWithDelta:(ccTime)delta {
    // check to see if orbitalDistance needs to change
    if (self.state != OrbitState) {
        // change orbitalDistance accordingly
        if (self.state == TransitionUpState) {
            // increment orbitalDistance
            self.orbitalRadius += self.orbitTransitionRate * delta;
        } else {
            // decrement orbitalDistance
            self.orbitalRadius -= self.orbitTransitionRate * delta;
        }
        
        // check if orbit has been transitioned too, then set state to OrbitState
        // get target orbit
        int targetOrbitRadius = 0;
        NSArray *possibleOrbits = [GameplayLayer getPossibleOrbits];
        if (self.state == TransitionUpState) {
            targetOrbitRadius = [(NSNumber *)[possibleOrbits objectAtIndex:(self.orbitIndex + 1)] intValue];
        } else {
            targetOrbitRadius = [(NSNumber *)[possibleOrbits objectAtIndex:(self.orbitIndex - 1)] intValue];
        }
        
        // whether the entity has completed its transition by either getting to or overshooting the target radius
        BOOL transitionComplete = NO;
        
        // now we know what the entity is targeting, and we know if they're moving up or down, we can check if they have met their target
        if (self.state == TransitionUpState) {
            if (self.orbitalRadius >= targetOrbitRadius) {
                transitionComplete = YES;
                self.orbitIndex++;
            }
        } else {
            if (self.orbitalRadius <= targetOrbitRadius) {
                transitionComplete = YES;
                self.orbitIndex--;
            }
        }
        
        // if metTarget, adjust the orbitalDistance and set our state to orbiting
        if (transitionComplete) {
            self.orbitalRadius = targetOrbitRadius;
            self.state = OrbitState;
        }
    }
}

- (void)setPositionWithDelta:(ccTime)delta {
    // now that the angle has changed, we need to reset the position and rotation of the sprite
    // get the new position by cos/sin -ing and then multiplying by the orbitalDistance, then adding the center point
    float newPositionX = cosf(self.angleRelativeToOrb) * self.orbitalRadius + CENTER_POINT.x;
    float newPositionY = sinf(self.angleRelativeToOrb) * self.orbitalRadius + CENTER_POINT.y;
    // set the sprites position
    self.sprite.position = CGPointMake(newPositionX, newPositionY);
}

- (void)setRotationWithDelta:(ccTime)delta {
    // set the sprite's rotation by converting the angleRelativeToOrb to degrees
    // it's negative because we're saying that rotation increases counter-clockwise, while self.sprite.rotation increases clockwise
    self.sprite.rotation = -self.angleRelativeToOrb * (180.0f / M_PI);
}

@end
