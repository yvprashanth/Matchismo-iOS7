//
//  PlayingCardDeck.m
//  FinalMatchismo
//
//  Created by PrashMaya on 14/06/15.
//  Copyright (c) 2015 PrashMaya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayingCard.h"
#import "PlayingCardDeck.h"

@implementation PlayingCardDeck

-(instancetype) init{
    self = [super init];
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
    return self;
}

@end