//
//  PlayingCard.m
//  FinalMatchismo
//
//  Created by PrashMaya on 13/06/15.
//  Copyright (c) 2015 PrashMaya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;

+(NSArray *)validSuits{
    return @[@"♥️",@"♦️", @"♠️", @"♣️"];
}

-(NSString *) contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}


-(int)match:(NSArray *)otherCards{
    int score = 0;
    if ([otherCards count] == 1) {
        PlayingCard *otherCard = [otherCards firstObject];
        if (otherCard.rank == self.rank) {
            score = 4;
        }else if([otherCard.suit isEqualToString:self.suit]){
            score = 1;
        }
    }
    return score;
}


-(NSString *) suit
{
    return _suit ? _suit : @"?";
}

-(void) setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

+(NSArray *)rankStrings{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"K", @"Q", @"J"];
}

+(NSUInteger)maxRank{
    return [[self rankStrings] count]-1;
}

-(void)setRank:(NSUInteger)rank{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end