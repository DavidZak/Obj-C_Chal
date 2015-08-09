//
//  MyAutoReleasePool.m
//  MyOwnPool
//
//  Created by Igor Sova on 28/07/15.
//  Copyright (c) 2015 Igor Sova. All rights reserved.
//

#import "MyAutoReleasePool.h"

@implementation MyAutoReleasePool

- (void)setObjects:(NSArray *)a
{
    _objects = [a mutableCopy];
    [_objects release];
}
- (NSArray *)objects
{
    return [_objects copy];
}

- (void)myAddObject:(id)object
{
    if (!_objects)
    {
        _objects = [[NSMutableArray alloc] init];
        NSLog(@"created");
    }
    [_objects addObject:object];
    NSLog(@"added");
}

-(id)init
{
    if(self = [super init])
    {
        NSLog(@"init: retainCount = %lu", (unsigned long)[self retainCount]);
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"_objects count: %lu",(unsigned long)_objects.count);
    for(int i = 0; i < _objects.count; i++)
    {
        NSLog(@"Object's retain count: %lu", (unsigned long)[_objects[i] retainCount]);
        while ([_objects[i] retainCount] > 1) {
            [_objects[i] release];
        }
        NSLog(@"%d'rd object in _objects: %@", i, _objects[i]);
        [_objects[i] release];
        NSLog(@"other object's retain count: %lu", (unsigned long)[_objects[i] retainCount]);
        NSLog(@"objects count: %lu", _objects.count);
        
    }
    NSLog(@"%lu", (unsigned long)[_objects retainCount]);
    _objects = nil;
    
    [super dealloc];
    NSLog(@"deallocated all");
}

@end
