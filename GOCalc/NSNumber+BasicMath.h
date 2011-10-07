//
//  NSNumber+BasicMath.h
//  GOCalc
//
//  Created by Samuel Goodwin on 10/7/11.
//  Copyright (c) 2011 SNAP Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (BasicMath)
- (NSNumber*)add:(NSNumber*)addition;
- (NSNumber*)sub:(NSNumber*)subtractor;
- (NSNumber*)mult:(NSNumber*)multiplier;
- (NSNumber*)div:(NSNumber*)divisor;
@end
