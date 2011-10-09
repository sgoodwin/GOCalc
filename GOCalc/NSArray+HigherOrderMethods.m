//
//  NSArray+HigherOrderMethods.m
//  GOCalc
//
//  Created by Samuel Goodwin on 10/4/11.
//  Copyright (c) 2011 SNAP Interactive. All rights reserved.
//

#import "NSArray+HigherOrderMethods.h"

@implementation NSArray (HigherOrderMethods)

- (NSArray *)map:(GOItemBlock)block{
    NSMutableArray *results = [[NSMutableArray alloc] initWithCapacity:[self count]];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [results addObject:block(idx, obj)];
    }];
    return results;
}

- (id)reduce:(GOReduceBlock)block{
    NSString *operation = nil;
    id result = nil;
    for(id item in self){
        if([item isKindOfClass:[NSArray class]]){
            result = block(result, operation, [item reduce:block]);
        }else{
            if([item isKindOfClass:[NSString class]]){
                operation = item;
            }else{
                result = block(result, operation, item);
            }
        }
    }
    return result;
}
@end
