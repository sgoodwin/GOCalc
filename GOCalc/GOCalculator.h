//
//  GOCalculator.h
//  GOCalc
//
//  Created by Samuel Goodwin on 10/4/11.
//  Copyright (c) 2011 SNAP Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GOParseNode;
@interface GOCalculator : NSObject

- (NSArray *)lex:(NSString*)inputString;
- (GOParseNode *)parse:(NSArray *)lexedInput;
- (NSNumber *)interpret:(GOParseNode *)parsedInput;
- (NSString *)compile:(NSArray *)parseInput;

- (NSNumber*)calculate:(NSString*)inputString;
@end
