//
//  main.m
//  MyOwnPool
//
//  Created by Igor Sova on 28/07/15.
//  Copyright (c) 2015 Igor Sova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyAutoReleasePool.h"

int main(int argc, const char * argv[]) {
    
    MyAutoReleasePool *pooll= [[MyAutoReleasePool alloc] init];
    
    NSDate *now = [[NSDate alloc] init];
    NSDate *now2 = [[NSDate alloc] init];
    [pooll myAddObject:now];
    [pooll myAddObject:now2];
    
    [pooll release];
    return 0;
    
}