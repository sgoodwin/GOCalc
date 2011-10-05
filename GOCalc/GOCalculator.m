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
        if([item isEqualToString:@"+"]){
            return @"add";
        }
        if([item isEqualToString:@"-"]){
            return @"sub";
        }
        if([item isEqualToString:@"*"]){
            return @"mult";
        }
        if([item isEqualToString:@"/"]){
            return @"div";
        }
        return item;
    } ];
}

- (NSArray *)parse:(NSArray *)lexedInput{
    NSUInteger length = [lexedInput count];
    NSMutableArray *parsedResult = [NSMutableArray arrayWithCapacity:length];
    NSUInteger i = 0;
    while(i < length){
        id item = [lexedInput objectAtIndex:i];
        i++;
        NSLog(@"Looking at item: %@, parsed result so far: %@", item, [parsedResult componentsJoinedByString:@","]);
        NSArray *theRest = [lexedInput subarrayWithRange:NSMakeRange(i, length-i)];
        if([item isKindOfClass:[NSString class]]){
            if([item isEqualToString:@"("]){
                [parsedResult addObject:[self parse:theRest]];
                return parsedResult;
            }else if([item isEqualToString:@")"]){
                return parsedResult;
            }else{
                [parsedResult addObject:item];
            }
        }else{
            [parsedResult addObject:item];
        }
    }
    return parsedResult;
}

- (NSNumber *)interperate:(NSArray*)parsedInput{
    NSLog(@"Parsed input has %@", [parsedInput componentsJoinedByString:@","]);
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
