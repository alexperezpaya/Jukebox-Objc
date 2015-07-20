//
//  NetworkTask.m
//  JukeboxObjc
//
//  Created by Alejandro on 02/06/15.
//  Copyright (c) 2015 Jukebox. All rights reserved.
//

#import "NetworkTask.h"

@implementation NetworkTask

- (id)init {
    self = [super init];
    if (self)
    {
        _successBlocks = [NSMutableArray array];
        _failureBlocks = [NSMutableArray array];
    }
    return self;
}

- (void)addSuccessBlock:(NetworkTaskSuccessBlock)successBlock
{
    [self addBlock:successBlock toArray:self.successBlocks];
}

- (void)addFailureBlock:(NetworkTaskFailureBlock)failureBlock
{
    [self addBlock:failureBlock toArray:self.failureBlocks];
}

- (void)addBlock:(id)block toArray:(NSMutableArray *)array
{
    if (block)
        [array addObject:block];
}

- (void)finishTaskWithError:(NSError *)error
{
    [self callFailureBlocksWithError:error];
}

- (void)finishTaskWithData:(id)data
{
    [self callSuccessBlocksWithData:data];
}

- (void)callFailureBlocksWithError:(NSError *)error
{
    
    NSArray *blocks = [self.failureBlocks copy]; // Avoid mutation
    
    for (NetworkTaskFailureBlock block in blocks)
    {
        block(self, error);
    }
}

- (void)callSuccessBlocksWithData:(id)data
{
    
    NSArray *blocks = [self.successBlocks copy]; // Avoid mutation
    
    for (NetworkTaskSuccessBlock block in blocks)
    {
        block(self, data);
    }
}

@end
