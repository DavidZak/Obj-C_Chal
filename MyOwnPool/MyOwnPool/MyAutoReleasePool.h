//
//  MyAutoReleasePool.h
//  MyOwnPool
//
//  Created by Igor Sova on 28/07/15.
//  Copyright (c) 2015 Igor Sova. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyAutoReleasePool : NSObject
{
    NSMutableArray *_objects;
    NSMutableArray *_pointCounts;
}
@property (nonatomic, copy) NSArray *objects;

- (void)setObjects:(NSArray *)a;
- (NSMutableArray *)objects;

//adding an object
- (void)myAddObject:(id)object;

@end
