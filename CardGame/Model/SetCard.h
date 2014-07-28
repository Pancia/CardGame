//
//  SetCard.h
//  CardGame
//
//  Created by Anthony D'Ambrosio on 7/27/14.
//  Copyright (c) 2014 DayZeroStudio. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card
@property (strong, nonatomic) NSString *type;

+ (NSArray *)validSetCards;
- (void)setTypeRandomly;
@end
