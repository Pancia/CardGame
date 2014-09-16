//
//  CardGameViewController.m
//  CardGame
//
//  Created by Anthony D'Ambrosio on 7/25/14.
//  Copyright (c) 2014 DayZeroStudio. All rights reserved.
//
// Abstract! Implement game, deck, ...

#import "CardGameViewController.h"

@interface CardGameViewController ()

@end

@implementation CardGameViewController

// Override!
- (IBAction)touchStartOverButton
{
    self.game = nil;
    self.matchingActionResultsLabel.text = nil;
    [self updateUI];
}

// Abstract
- (CardGame *)game
{
    return nil;
}

// Abstract
- (Deck *)deck
{
    return nil;
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    int cardIndex = [self.cardButtons indexOfObject:sender];
    self.matchingActionResultsLabel.text = [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        int cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        if (card.isChosen) {
            [cardButton setAttributedTitle:
             [[NSAttributedString alloc] initWithString:card.contents attributes:@{NSForegroundColorAttributeName : [UIColor blueColor]}]
                              forState:UIControlStateNormal];
        } else {
            [cardButton setAttributedTitle:[self titleForCard:card] forState:UIControlStateNormal];
        }
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}

- (NSAttributedString *)titleForCard:(Card *)card
{
    return [[NSAttributedString alloc] initWithString:(card.isChosen ? card.contents : @"")];
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

@end
