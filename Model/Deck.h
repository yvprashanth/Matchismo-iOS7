//
//  Deck.h
//  FinalMatchismo
//
//  Created by PrashMaya on 13/06/15.
//  Copyright (c) 2015 PrashMaya. All rights reserved.
//

#ifndef FinalMatchismo_Deck_h
#define FinalMatchismo_Deck_h


#endif
#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void)addCard : (Card *)card atTop: (BOOL)atTop;

-(void)addCard : (Card *)card;

-(Card *)drawRandomCard;

@end