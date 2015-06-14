//
//  PlayingCard.h
//  FinalMatchismo
//
//  Created by PrashMaya on 13/06/15.
//  Copyright (c) 2015 PrashMaya. All rights reserved.
//

#ifndef FinalMatchismo_PlayingCard_h
#define FinalMatchismo_PlayingCard_h


#endif

#import "Card.h"
@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+(NSArray *)validSuits;
+(NSUInteger)maxRank;

@end