//
//  SetMatchingGame.m
//  CardGame
//
//  Created by Anthony D'Ambrosio on 7/27/14.
//  Copyright (c) 2014 DayZeroStudio. All rights reserved.
//

#import "SetMatchingGame.h"

@interface SetMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@end

@implementation SetMatchingGame
@synthesize score = _score;
@synthesize cards = _cards;

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (count < 2)
        return nil;
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

#define NUMBER_CARDS_TO_MATCH 3
static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (NSString *)chooseCardAtIndex:(NSUInteger)index
{
    NSMutableString *message = [[NSMutableString alloc] init];
    Card *card = [self cardAtIndex:index];
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            self.score -= COST_TO_CHOOSE;
            NSMutableArray *chosenCards = [[NSMutableArray alloc] init];
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    [chosenCards addObject:otherCard];
                }
            }
            if ([chosenCards count] == NUMBER_CARDS_TO_MATCH-1) {
                int matchScore = [card match:chosenCards];
                if (matchScore) { // Success!
                    self.score += matchScore * MATCH_BONUS;
                    card.matched = YES;
                    [message appendFormat:@"Matched %@ ", card.contents];
                    for (Card *otherCard in chosenCards) {
                        otherCard.matched = YES;
                        [message appendFormat:@"%@ ", otherCard.contents];
                    }
                    [message appendFormat:@"for %d points.", matchScore * MATCH_BONUS];
                } else { // Failed to match
                    self.score -= MISMATCH_PENALTY;
                    [message appendFormat:@"%@ ", card.contents];
                    for (Card *otherCard in chosenCards) {
                        otherCard.chosen = NO;
                        [message appendFormat:@"%@ ", otherCard.contents];
                    }
                    [message appendFormat:@"don't match! %d point penalty!",
                     MISMATCH_PENALTY];
                }
            } else {
                //message = all cards
                [message appendFormat:@"%@ ", card.contents];
                for (Card *otherCard in chosenCards) {
                    [message appendFormat:@"%@ ", otherCard.contents];
                }
            }
            card.chosen = YES;
        }
    }
    return message;
}

@end
