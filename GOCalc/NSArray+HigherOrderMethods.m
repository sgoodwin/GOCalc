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
    for(id item in self){
        [results addObject:block(item)];
    }
    return results;
}

@end
