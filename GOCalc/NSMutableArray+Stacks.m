//
//  NSMutableArray+Stacks.m
//  GOCalc
//
//  Created by Samuel Goodwin on 10/6/11.
//  Copyright (c) 2011 SNAP Interactive. All rights reserved.
//

#import "NSMutableArray+Stacks.h"

@implementation NSMutableArray (Stacks)

- (void)push:(id)object{
    [self addObject:object];
}

- (id)pop{
    id object = [self objectAtIndex:0];
    [self removeObject:object];
    return object;
}

@end
