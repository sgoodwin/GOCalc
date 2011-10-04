//
//  GOCalculator.h
//  GOCalc
//
//  Created by Samuel Goodwin on 10/4/11.
//  Copyright (c) 2011 SNAP Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GOCalculator : NSObject

- (NSArray *)lex:(NSString*)inputString;
- (NSArray *)parse:(NSArray *)lexedInput;
- (NSNumber *)interperate:(NSArray*)parsedInput;
- (NSString *)compile:(NSArray *)parseInput;

- (NSNumber*)calculate:(NSString*)inputString;
@end
