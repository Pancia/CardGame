//
//  CardGameViewController.h
//  CardGame
//
//  Created by Anthony D'Ambrosio on 7/25/14.
//  Copyright (c) 2014 DayZeroStudio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardGame.h"

@interface CardGameViewController : UIViewController
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *matchingActionResultsLabel;

// Protected & Abstract!
- (Deck *)deck;
- (CardGame *)game;
- (IBAction)touchStartOverButton;
- (IBAction)touchCardButton:(UIButton *)sender;
- (void)updateUI;
@end

