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

@implementation GOCalculator

- (NSArray *)lex:(NSString*)inputString{
    NSString *cleaned = [[inputString stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]] stringByTrimmingCharactersInSet:[NSCharacterSet symbolCharacterSet]];
    NSArray *splitItems = [cleaned componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return [splitItems map:^id(id item){
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
