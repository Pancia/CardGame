//
//  cardgameViewController.m
//  CardGame
//
//  Created by Anthony D'Ambrosio on 7/25/14.
//  Copyright (c) 2014 DayZeroStudio. All rights reserved.
//

#import "cardgameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface cardgameViewController()
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *matchingActionResultsLabel;
@end

@implementation cardgameViewController

- (IBAction)touchStartOverButton
{
    _game = nil;
    self.matchingActionResultsLabel.text = nil;
    [self updateUI];
}

- (CardMatchingGame *)game
{
    if (!_game) {
        _game = [[CardMatchingGame alloc]
                    initWithCardCount:[self.cardButtons count]
                        usingDeck:self.deck
                 withMatchingNumber:3];
    }
    return _game;
}

- (Deck *)deck
{
    return [[PlayingCardDeck alloc] init];
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
        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}

- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

@end
