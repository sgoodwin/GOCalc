//
//  GOParseNode.h
//  GOCalc
//
//  Created by Samuel Goodwin on 10/6/11.
//  Copyright (c) 2011 SNAP Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

// A parse node is like a set of parens "()", it holds anything inside the parens and also knows about outer parens

@interface GOMathNode : NSObject
@property(nonatomic, weak) GOMathNode *parent;
@property(nonatomic, retain) NSMutableArray *contents;
+ (id)nodeWithParent:(GOMathNode*)parent;
+ (id)node;
- (void)addItem:(id)item;
- (NSNumber*)calculate;
@end
