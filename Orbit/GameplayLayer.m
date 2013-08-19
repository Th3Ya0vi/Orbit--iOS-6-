//
//  GameplayLayer.m
//  Orbit
//
//  Created by Hamdan Javeed on 2013-08-15.
//  Copyright (c) 2013 Hamdan Javeed. All rights reserved.
//
//  The layer that is the game.

#import "GameplayLayer.h"
#import "Player.h"
#import "Orb.h"

@interface GameplayLayer ()
// the player
@property (nonatomic) Player *player;
// the orb
@property (nonatomic) Orb *orb;

// the time
@property (nonatomic) float time;
// the time label
@property (nonatomic) CCLabelTTF *timeLabel;
@end

@implementation GameplayLayer

// return this layer encapsulated in a CCScene (needed for transitions)
+ (CCScene *)scene {
    CCScene *scene = [CCScene node];
    [scene addChild:[GameplayLayer node]];
    return scene;
}

// initialize layer
- (id)init {
    self = [super init];
    if (self) {
        // initialize player property
        self.player = [[Player alloc] init];
        
        // initialize the orb
        self.orb = [[Orb alloc] init];
        
        // add the player and the orb to this layer
        [self addChild:[self.orb sprite] z:0]; // the orb has a z of 0
        [self addChild:[self.player sprite] z:1]; // the player has a z of 1
        
        // set touch enabled so we can switch orbits
        [self setTouchEnabled:YES];
        
        // set the time and initialize the time counter
        self.time = 0.0f;
        self.timeLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Time: %f", self.time]
                                             fontName:@"Helvetica Neue"
                                             fontSize:24];
        self.timeLabel.position = CGPointMake(self.timeLabel.boundingBox.size.width / 2.0f, WINDOW_SIZE.height - self.timeLabel.boundingBox.size.height / 2.0f);
        [self addChild:self.timeLabel z:2];
        
        // calls update: every frame
        [self scheduleUpdate];
    }
    return self;
}

- (void)setTime:(float)time {
    _time = time;
    int timeInt = (int)time;
    [self.timeLabel setString:[NSString stringWithFormat:@"Time: %d", timeInt]];
    self.timeLabel.position = CGPointMake(self.timeLabel.boundingBox.size.width / 2.0f, WINDOW_SIZE.height - self.timeLabel.boundingBox.size.height / 2.0f);
}

- (void)update:(ccTime)delta {
    [self.player update:delta];
    self.time += delta;
}

// the player touched the screen
- (void)ccTouchesBegan:(NSSet *)touches
             withEvent:(UIEvent *)event {
    
    // only get one of the touches
    UITouch *touch = [touches anyObject];
    // get the touch's location in node space
    CGPoint touchLocation = [self convertToNodeSpace:[touch locationInView:[touch view]]];
    
    BOOL canMoveUp = (self.player.orbitIndex != 2);
    BOOL canMoveDown = (self.player.orbitIndex != 0);
    
    // check to see if we need + can to move up or down an orbit
    if (touchLocation.x >= CENTER_POINT.x && canMoveUp) {
        // move up an orbit
        self.player.state = TransitionUpState;
    } else if (touchLocation.x <= CENTER_POINT.x && canMoveDown) {
        // move down an orbit
        self.player.state = TransitionDownState;
    }
}

+ (NSArray *)getPossibleOrbits {
    return @[@(40), @(80), @(120)];
}

@end

#pragma mark - Z Order
// Z(0): Orb
// Z(1): Player
// Z(2): Time label
