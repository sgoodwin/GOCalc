//
//  main.m
//  GOCalc
//
//  Created by Samuel Goodwin on 10/4/11.
//  Copyright (c) 2011 SNAP Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GOCalculator.h"
#import "NSMutableArray+Stacks.h"

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        NSFileHandle *stdin = [NSFileHandle fileHandleWithStandardInput];
        NSFileHandle *stdout = [NSFileHandle fileHandleWithStandardOutput];
        GOCalculator *calculator = [[GOCalculator alloc] init];
        NSMutableArray *inputLog = [NSMutableArray arrayWithCapacity:4];
        while(1){
            [stdout writeData:[@"> " dataUsingEncoding:NSUTF8StringEncoding]];
            NSData *newdata = [stdin availableData];
            NSString *string = [[NSString alloc] initWithData:newdata encoding:NSUTF8StringEncoding];
            [inputLog push:string];
            [stdout writeData:[[NSString stringWithFormat:@"%@\n", [calculator calculate:string]] dataUsingEncoding:NSUTF8StringEncoding]];
        }
    }
    return 0;
}

