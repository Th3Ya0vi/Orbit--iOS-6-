//
//  OrbitTransitionHandler.h
//  Orbit
//
//  Created by Hamdan Javeed on 2013-08-16.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface OrbitTransitionHandler : NSObject
// returns the single OrbitTransitionHandler object
+ (OrbitTransitionHandler *)sharedOrbitTransitionHandler;

// animates the 
- (void)animateOrbitTransitionUpForPlayer:(Player *)player;

- (void)updateAnimationForAllObjectsInPool;
@end
