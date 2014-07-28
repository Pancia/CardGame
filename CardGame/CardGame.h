//
//  Game.h
//  CardGame
//
//  Created by Anthony D'Ambrosio on 7/27/14.
//  Copyright (c) 2014 DayZeroStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardGame : NSObject
@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of Card

// designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;
- (NSString *)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;
@end
