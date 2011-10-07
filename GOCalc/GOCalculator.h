//
//  GOCalculator.h
//  GOCalc
//
//  Created by Samuel Goodwin on 10/4/11.
//  Copyright (c) 2011 SNAP Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GOMathNode;
@interface GOCalculator : NSObject

- (NSArray *)lex:(NSString*)inputString;
- (GOMathNode *)parse:(NSArray *)lexedInput;
- (NSNumber *)interpret:(GOMathNode *)parsedInput;
- (NSString *)compile:(GOMathNode *)parseInput;

- (NSNumber*)calculate:(NSString*)inputString;
@end
