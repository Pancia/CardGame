//
//  SetGameViewController.m
//  CardGame
//
//  Created by Anthony D'Ambrosio on 7/27/14.
//  Copyright (c) 2014 DayZeroStudio. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetMatchingDeck.h"
#import <UIKit/UIColor.h>

@interface SetGameViewController ()
@property (strong, nonatomic) SetMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation SetGameViewController
@synthesize game = _game;

- (SetMatchingGame *)game
{
    if (!_game) {
        _game = [[SetMatchingGame alloc]
                 initWithCardCount:[self.cardButtons count]
                 usingDeck:self.deck];
    }
    return _game;
}

- (Deck *)deck
{
    return [[SetMatchingDeck alloc] init];
}

- (NSAttributedString *)titleForCard:(Card *)card
{
    return [[NSAttributedString alloc] initWithString:card.contents attributes:@{NSForegroundColorAttributeName : [UIColor redColor]}];
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:@"cardfront"];
}

@end
