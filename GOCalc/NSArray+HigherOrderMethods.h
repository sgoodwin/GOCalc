//
//  NSArray+HigherOrderMethods.h
//  GOCalc
//
//  Created by Samuel Goodwin on 10/4/11.
//  Copyright (c) 2011 SNAP Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id (^GOItemBlock)(NSUInteger idx, id item);
typedef id (^GOReduceBlock)(id runningResult, NSString* operation, id nextItem);

@interface NSArray (HigherOrderMethods)
- (NSArray *)map:(GOItemBlock)block;
- (id)reduce:(GOReduceBlock)block;
@end
