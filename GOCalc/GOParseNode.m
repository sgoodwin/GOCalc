//
//  GOParseNode.m
//  GOCalc
//
//  Created by Samuel Goodwin on 10/6/11.
//  Copyright (c) 2011 SNAP Interactive. All rights reserved.
//

#import "GOParseNode.h"

@implementation GOParseNode
@synthesize parent = _parent, contents = _contents;

+ (id)nodeWithParent:(GOParseNode*)parent{
    GOParseNode *node = [self node];
    [parent addItem:node];
    [node setParent:parent];
    return node;
}

+ (id)node{
    GOParseNode *node = [[self alloc] init];
    return node; // Normoally without arc I would autorelease here, now my habit of convenience methods is sorta awkward.
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
@end
