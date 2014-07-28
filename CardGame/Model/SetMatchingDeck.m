//
//  SetMatchingDeck.m
//  CardGame
//
//  Created by Anthony D'Ambrosio on 7/27/14.
//  Copyright (c) 2014 DayZeroStudio. All rights reserved.
//

#import "SetMatchingDeck.h"

@implementation SetMatchingDeck

static const int MAX_SIZE_DECK = 12;

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < MAX_SIZE_DECK; i++) {
            SetCard *card = [[SetCard alloc] init];
            [card setTypeRandomly];
            [self addCard:card atTop:YES];
        }
    }
    
    return self;
}
@end
