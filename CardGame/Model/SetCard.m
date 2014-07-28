//
//  SetCard.m
//  CardGame
//
//  Created by Anthony D'Ambrosio on 7/27/14.
//  Copyright (c) 2014 DayZeroStudio. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

+ (NSArray *)validSetCards
{
    return @[@"@", @"#", @"$"];
}

- (void)setType:(NSString *)type
{
    if ([[SetCard validSetCards] containsObject:type]) {
        _type = type;
    }
}

- (void)setTypeRandomly
{
    self.type = [[SetCard validSetCards] objectAtIndex:arc4random()%3];
}

- (NSString *)contents
{
    return self.type;
}

/**
 *  @returns 1 point for 2/3 matching, 3 points for 3/3 matching
 */
- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    assert([otherCards count] == 2);
    
    for (SetCard *card in otherCards) {
        if ([self.type isEqualToString:card.type]) {
            score += 1;
        }
    }
    SetCard *firstCard = [otherCards firstObject];
    SetCard *secondCard = [otherCards objectAtIndex:1];
    if ([firstCard.type isEqualToString:secondCard.type]) {
        score += 1;
    }
    
    return score;
}

@end
