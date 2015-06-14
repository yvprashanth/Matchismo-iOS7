//
//  Card.h
//  FinalMatchismo
//
//  Created by PrashMaya on 13/06/15.
//  Copyright (c) 2015 PrashMaya. All rights reserved.
//

#ifndef FinalMatchismo_Card_h
#define FinalMatchismo_Card_h


#endif
#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

-(int)match:(NSArray *) otherCards;

@end