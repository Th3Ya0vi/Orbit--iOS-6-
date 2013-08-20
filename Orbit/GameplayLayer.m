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
#import "Enemy.h"

@interface GameplayLayer ()
// the player
@property (nonatomic) Player *player;
// the orb
@property (nonatomic) Orb *orb;

// the time
@property (nonatomic) float time;
// the time label
@property (nonatomic) CCLabelTTF *timeLabel;

// an array of all the enemies currently in the game
@property (nonatomic) NSMutableArray *enemies;
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
        [self addChild:[self.orb sprite] z:50]; // the orb has a z of 50
        [self addChild:[self.player sprite] z:49]; // the player has a z of 49
        
        // set touch enabled so we can switch orbits
        [self setTouchEnabled:YES];
        
        // set the time and initialize the time counter
        self.time = 0.0f;
        self.timeLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Time: %f", self.time]
                                             fontName:@"Helvetica Neue"
                                             fontSize:24];
        self.timeLabel.position = CGPointMake(self.timeLabel.boundingBox.size.width / 2.0f, WINDOW_SIZE.height - self.timeLabel.boundingBox.size.height / 2.0f);
        [self addChild:self.timeLabel z:47];
        
        // initialize the enemy array
        self.enemies = [[NSMutableArray alloc] init];
        
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
    static float enemyTimer = 0.0f;
    enemyTimer += delta;
    if (enemyTimer > 5.0f) {
        [self.enemies addObject:[[Enemy alloc] initWithTargetOrbitIndex:(arc4random() % 3)
                                                                  layer:self]];
        enemyTimer = 0.0f;
    }
    for (Enemy *enemy in self.enemies) {
        [enemy update:delta];
    }
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
// Z(50): Orb
// Z(49): Player
// Z(48): Enemies
// Z(47): Time label
