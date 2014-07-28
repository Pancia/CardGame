//
//  Card.h
//  CardGame
//
//  Created by Anthony D'Ambrosio on 7/25/14.
//  Copyright (c) 2014 DayZeroStudio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;
@end
