//
//  Game.m
//  CardGame
//
//  Created by Anthony D'Ambrosio on 7/27/14.
//  Copyright (c) 2014 DayZeroStudio. All rights reserved.
//
// Abstract

#import "CardGame.h"

@interface CardGame()
@property (nonatomic, readwrite) NSInteger score;
@end

@implementation CardGame

- (NSMutableArray *)cards
{
    return nil;
}

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck
{
    return nil;
}

- (NSString *)chooseCardAtIndex:(NSUInteger)index
{
    return nil;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;;
}

@end
