//
//  ViewController.m
//  FinalMatchismo
//
//  Created by PrashMaya on 13/06/15.
//  Copyright (c) 2015 PrashMaya. All rights reserved.
//

#import "ViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsCount;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;
@end

@implementation ViewController

-(Deck *) deck{
    if (!_deck) {
        _deck = [self createDeck];
    }
    return _deck;
}

- (Deck *)createDeck{
    return [[PlayingCardDeck alloc] init];
}

-(void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsCount.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    if([sender.currentTitle length]){
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    }
    else
    {
        Card *randomCard = [self.deck drawRandomCard];
        if (randomCard) {
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
            [sender setTitle:randomCard.contents forState:UIControlStateNormal];
        }
    }
    self.flipCount++;
}

@end
