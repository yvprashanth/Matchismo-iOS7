//
//  CardMatchingGame.h
//  FinalMatchismo
//
//  Created by PrashMaya on 14/06/15.
//  Copyright (c) 2015 PrashMaya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"


@interface CardMatchingGame : NSObject

-(instancetype) initWithCardCount : (NSUInteger)count
                        usingDeck : (Deck *)deck;

-(void)chooseCardAtIndex : (NSUInteger)index;
-(Card *)cardAtIndex : (NSUInteger)index;

@end