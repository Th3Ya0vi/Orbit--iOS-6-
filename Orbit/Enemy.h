//
//  Enemy.h
//  Orbit
//
//  Created by Hamdan Javeed on 2013-08-19.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//

#import "Entity.h"

@interface Enemy : Entity
- (id)initWithTargetOrbitIndex:(int)targetOrbitIndex
                          layer:(CCLayer *)layer;
@end
