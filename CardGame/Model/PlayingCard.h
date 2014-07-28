//
//  PlayingCard.h
//  CardGame
//
//  Created by Anthony D'Ambrosio on 7/25/14.
//  Copyright (c) 2014 DayZeroStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card
@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;
@end
