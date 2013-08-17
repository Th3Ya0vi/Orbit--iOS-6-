//
//  OrbitTransition.h
//  Orbit
//
//  Created by Hamdan Javeed on 2013-08-16.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface OrbitTransition : NSObject
@property (nonatomic) Player *player;
@property (nonatomic) float departureOrbit;
@property (nonatomic) float arrivalOrbit;

- (id)initWithPlayer:(Player *)player
      departureOrbit:(float)departureOrbit
        arrivalOrbit:(float)arrivalOrbit;
@end
