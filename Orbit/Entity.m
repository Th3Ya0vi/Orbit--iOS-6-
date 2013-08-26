//
//  Entity.m
//  Orbit
//
//  Created by Hamdan Javeed on 2013-08-17.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//
//  Something in the game that moves. The Player is an entity.

#import "Entity.h"
#import "GameplayLayer.h"

@implementation Entity

// the following method gives each property a default value, a subclass of Entity can change the values
// subclasses MUST set their own sprites
// if subclasses change their orbitalIndex, then they must reset their orbitalRadius
- (id)init {
    self = [super init];
    if (self) {
        // set our initial state to OrbitState
        self.state = OrbitState;
        
        // as a default the orbitIndex is set to 0
        self.orbitIndex = 0;
        
        // the initial angle
        self.angleRelativeToOrb = 0.0f;
        
        // how far away the entity is from the orb
        self.orbitalRadius = [(NSNumber *)[[GameplayLayer getPossibleOrbits] objectAtIndex:self.orbitIndex] floatValue];
        
        // how many pixels the entity travels per second
        self.pixelsPerSecond = 300.0f;
        
        // how quickly the entity transitions from orbits
        self.orbitTransitionRate = 300.0f;
    }
    return self;
}

// updates the entity's position and rotation
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
