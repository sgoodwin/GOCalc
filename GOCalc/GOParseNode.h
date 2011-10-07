//
//  GOParseNode.h
//  GOCalc
//
//  Created by Samuel Goodwin on 10/6/11.
//  Copyright (c) 2011 SNAP Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

// A parse node is like a set of parens "()", it holds anything inside the parens and also knows about outer parens

@interface GOParseNode : NSObject
@property(nonatomic, weak) GOParseNode *parent;
@property(nonatomic, retain) NSMutableArray *contents;
+ (id)nodeWithParent:(GOParseNode*)parent;
+ (id)node;
- (void)addItem:(id)item;
@end
