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
#import "GOMathNode.h"

@interface GOCalculator()
- (void)insertParenthesisAroundIndex:(NSUInteger)i intoArray:(NSMutableArray *)array;
@end

@implementation GOCalculator

- (NSArray *)lex:(NSString*)inputString{
    NSString *cleaned = [[inputString stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]] stringByTrimmingCharactersInSet:[NSCharacterSet symbolCharacterSet]];
    NSMutableArray *splitItems = [[cleaned componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] mutableCopy];
    // Parenthesis insertion!
    NSUInteger i = 0;
    for(i=0;i<[splitItems count];i++){
        NSString *item = [splitItems objectAtIndex:i];
        if([item isEqualToString:@"/"]){
            [self insertParenthesisAroundIndex:i intoArray:splitItems];
            i++;
        }
        if([item isEqualToString:@"*"]){
            [self insertParenthesisAroundIndex:i intoArray:splitItems];
            i++;
        }
    }
    
    // Map math symbols to method names and convert numbers to actual numbers.
    return [splitItems map:^id(NSUInteger idx, id item){
        if([item intValue]){
            return [NSNumber numberWithInt:[item intValue]];
        }
        if([item isEqualToString:@"+"]){
            return @"add:";
        }
        if([item isEqualToString:@"-"]){
            return @"sub:";
        }
        if([item isEqualToString:@"*"]){
            return @"mult:";
        }
        if([item isEqualToString:@"/"]){
            return @"div:";
        }
        return item;
    } ];
}

- (void)insertParenthesisAroundIndex:(NSUInteger)i intoArray:(NSMutableArray *)array{
    NSInteger leftIndex = NSNotFound;
    for(NSInteger idx = [array count]-1;idx>-1;idx--){
        NSLog(@"idx = %lu", idx);
        
        NSString *item = [array objectAtIndex:idx];
        if([item rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]].location != NSNotFound){
            leftIndex = idx-2;
            break;
        }
        if(leftIndex < 0){
            leftIndex = 0;
        }
    }
    [array insertObject:@"(" atIndex:leftIndex];
    
    NSUInteger rightIndex = NSNotFound;
    for(NSUInteger idx = 0;idx<[array count];idx++){
        NSString *item = [array objectAtIndex:idx];
        if([item rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]].location != NSNotFound){
            rightIndex = idx+1;
        }
    }
    if(NSNotFound == rightIndex){
        rightIndex = [array count];
    }
    [array insertObject:@")" atIndex:rightIndex];
    NSLog(@"Array now: %@", array);
}

- (GOMathNode *)parse:(NSArray *)lexedInput{
    NSUInteger length = [lexedInput count];
    NSUInteger i = 0;
    GOMathNode *root = [GOMathNode node];
    GOMathNode *currentNode = root;
    for(i=0;i<length;i++){
        id item = [lexedInput objectAtIndex:i];
        if([item isKindOfClass:[NSString class]]){
            NSString *string = (NSString*)item;
            if([string isEqualToString:@"("]){
                currentNode = [GOMathNode nodeWithParent:currentNode];
            }else if([string isEqualToString:@")"]){
                currentNode = [currentNode parent];
            }else{
                [currentNode addItem:item];
            }
        }else{
            [currentNode addItem:item];
        }
    }
    return root;
}

- (NSNumber *)interpret:(GOMathNode *)parsedInput{
    return [parsedInput calculate];
}

- (NSString *)compile:(GOMathNode *)parseInput{
    return [parseInput description];
}

- (NSNumber*)calculate:(NSString*)inputString{
    NSArray *lexed = [self lex:inputString];
    GOMathNode *parsed = [self parse:lexed];
    NSNumber *result = [self interpret:parsed];
    return result;
}

@end
