//
//  GOCalculator.m
//  GOCalc
//
//  Created by Samuel Goodwin on 10/4/11.
//  Copyright (c) 2011 SNAP Interactive. All rights reserved.
//

#import "GOCalculator.h"
#import "NSArray+HigherOrderMethods.h"

@implementation GOCalculator

- (NSArray *)lex:(NSString*)inputString{
    NSString *cleaned = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    NSArray *splitItems = [cleaned componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return [splitItems map:^id(id item){
        if([item intValue]){
            return [NSNumber numberWithInt:[item intValue]];
        }
        return NSSelectorFromString(item);
    } ];
}

- (NSArray *)parse:(NSArray *)lexedInput{
    NSLog(@"parsing: %@", [lexedInput valueForKeyPath:@"class"]);
    return nil;
}

- (NSNumber *)interperate:(NSArray*)parsedInput{
    return [NSNumber numberWithInt:0];
}

- (NSString *)compile:(NSArray *)parseInput{
    return @"0";
}

- (NSNumber*)calculate:(NSString*)inputString{
    NSArray *lexed = [self lex:inputString];
    NSArray *parsed = [self parse:lexed];
    NSNumber *result = [self interperate:parsed];
    return result;
}

@end
