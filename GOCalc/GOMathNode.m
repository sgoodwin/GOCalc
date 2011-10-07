//
//  GOParseNode.m
//  GOCalc
//
//  Created by Samuel Goodwin on 10/6/11.
//  Copyright (c) 2011 SNAP Interactive. All rights reserved.
//

#import "GOMathNode.h"
#import "NSArray+HigherOrderMethods.h"
#import "NSNumber+BasicMath.h"

@implementation GOMathNode
@synthesize parent = _parent, contents = _contents;

+ (id)nodeWithParent:(GOMathNode*)parent{
    GOMathNode *node = [self node];
    [parent addItem:node];
    [node setParent:parent];
    return node;
}

+ (id)node{
    GOMathNode *node = [[self alloc] init];
    return node; // Normally, without arc, I would autorelease here, now my habit of convenience methods is sorta awkward.
}

- (NSMutableArray*)contents{
    if(_contents){
        return _contents;
    }
    _contents = [[NSMutableArray alloc] initWithCapacity:2];
    return _contents;
}

- (void)addItem:(id)item{
    [[self contents] addObject:item];
}

- (NSString*)description{
    return [[[[self.contents description] stringByReplacingOccurrencesOfString:@"\n" withString:@""] stringByReplacingOccurrencesOfString:@" " withString:@""] stringByReplacingOccurrencesOfString:@"\"" withString:@""];
}

- (NSNumber*)calculate{
    return [[self contents] reduce:^(id runningResult, NSString *operation, id item){
        NSNumber *rightSide = nil;
        if([item isKindOfClass:[GOMathNode class]]){
            rightSide = [item calculate];
        }else{
            rightSide = item;
        }
        NSNumber *leftSide = nil;
        if(runningResult){
            leftSide = runningResult;
        }else{
            leftSide = [NSNumber numberWithInteger:0]; // This is so the first execution of this block doesn't ruin things.
        }
        
        SEL selector = @selector(add:);
        if(operation){
            selector = NSSelectorFromString(operation); // This is so the first execution of this block doesn't ruin things.
        }
        NSMethodSignature *signature = [[NSNumber class] instanceMethodSignatureForSelector:selector];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setSelector:selector];
        [invocation setArgument:&rightSide atIndex:2];
        [invocation setTarget:leftSide];
        [invocation invoke];
        NSNumber *result = nil;
        [invocation getReturnValue:&result];
        return result;
    }];
}

@end
