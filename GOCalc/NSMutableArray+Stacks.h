//
//  NSMutableArray+Stacks.h
//  GOCalc
//
//  Created by Samuel Goodwin on 10/6/11.
//  Copyright (c) 2011 SNAP Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Stacks)
- (void)push:(id)object;
- (id)pop;
@end
