//
//  NSNumber+BasicMath.m
//  GOCalc
//
//  Created by Samuel Goodwin on 10/7/11.
//  Copyright (c) 2011 SNAP Interactive. All rights reserved.
//

#import "NSNumber+BasicMath.h"

@implementation NSNumber (BasicMath)

- (NSNumber*)add:(NSNumber*)addition{
    NSInteger leftSide = [self integerValue];
    NSInteger rightSide = [addition integerValue];
    return [NSNumber numberWithInteger:leftSide+rightSide];
}

- (NSNumber*)sub:(NSNumber*)subtractor{
    NSInteger leftSide = [self integerValue];
    NSInteger rightSide = [subtractor integerValue];
    return [NSNumber numberWithInteger:leftSide-rightSide];
}

- (NSNumber*)mult:(NSNumber*)multiplier{
    NSInteger leftSide = [self integerValue];
    NSInteger rightSide = [multiplier integerValue];
    return [NSNumber numberWithInteger:leftSide*rightSide];
}

- (NSNumber*)div:(NSNumber*)divisor{
    float leftSide = [self floatValue];
    float rightSide = [divisor floatValue];
    return [NSNumber numberWithInteger:leftSide/rightSide];
}

@end
