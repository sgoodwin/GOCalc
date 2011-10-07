//
//  GOCalculator.m
//  GOCalc
//
//  Created by Samuel Goodwin on 10/4/11.
//  Copyright (c) 2011 SNAP Interactive. All rights reserved.
//

#import "GOCalculator.h"
#import "NSArray+HigherOrderMethods.h"
#import "NSMutableArray+Stacks.h"

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
    NSLog(@"handling lexed input: %@", lexedInput);
    NSUInteger length = [lexedInput count];
    NSMutableArray *parsedResult = [NSMutableArray arrayWithCapacity:length];
    NSUInteger i = 0;
    for(i=0;i<length;i++){
        id item = [lexedInput objectAtIndex:i];
        if([item isKindOfClass:[NSString class]]){
            NSString *string = (NSString*)item;
            if([string isEqualToString:@"("]){
                i++;
                NSArray *theRest = [lexedInput subarrayWithRange:NSMakeRange(i, length-i)];
                [parsedResult addObject:[self parse:theRest]];
                return parsedResult;
            }else if([string isEqualToString:@")"]){
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

- (NSNumber *)interpret:(NSArray*)parsedInput{
    NSLog(@"Parsed input has %@", [parsedInput componentsJoinedByString:@","]);
    return [NSNumber numberWithInt:0];
}

- (NSString *)compile:(NSArray *)parseInput{
    return @"0";
}

- (NSNumber*)calculate:(NSString*)inputString{
    NSArray *lexed = [self lex:inputString];
    NSArray *parsed = [self parse:lexed];
    NSNumber *result = [self interpret:parsed];
    return result;
}

@end
