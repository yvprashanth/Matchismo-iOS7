//
//  CardMatchingGame.m
//  FinalMatchismo
//
//  Created by PrashMaya on 14/06/15.
//  Copyright (c) 2015 PrashMaya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards;

@end

@implementation CardMatchingGame

-(NSMutableArray *)cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}


-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self =[super init];
    // iterate through the passed in number of cards, drawRandomCard from passed deck, then addObject to our NSMutableArray of cards each time
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

-(Card *)cardAtIndex:(NSUInteger)index  {
    if (index < [self.cards count]) {
        return self.cards[index];
    }
    return nil;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

-(void)chooseCardAtIndex:(NSUInteger)index{
    Card *card = [self cardAtIndex:index];
    
    // We will allow only unmatched cards to be chosen
    if(!card.isMatched){
        if (card.isChosen) {
            card.chosen = NO;
        }else {
            // match against other chosen cards
            
            for (Card *otherCard in self.cards) {
                // looking for ones that are unmatched and are already chosen
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
                    }else{
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                                    // Can only choose 2 cards for now
                                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
    
}

@end