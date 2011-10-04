//
//  main.m
//  GOCalc
//
//  Created by Samuel Goodwin on 10/4/11.
//  Copyright (c) 2011 SNAP Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GOCalculator.h"

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        NSFileHandle *stdin = [NSFileHandle fileHandleWithStandardInput];
        NSFileHandle *stdout = [NSFileHandle fileHandleWithStandardOutput];
        GOCalculator *calculator = [[GOCalculator alloc] init];
        while(1){
            [stdout writeData:[@"> " dataUsingEncoding:NSUTF8StringEncoding]];
            NSData *newdata = [stdin availableData];
            NSString *string = [[NSString alloc] initWithData:newdata encoding:NSUTF8StringEncoding];
            [stdout writeData:[[NSString stringWithFormat:@"%@\n", [calculator calculate:string]] dataUsingEncoding:NSUTF8StringEncoding]];
        }
    }
    return 0;
}

