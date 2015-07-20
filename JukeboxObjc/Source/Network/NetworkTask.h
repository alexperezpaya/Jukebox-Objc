//
//  NetworkTask.h
//  JukeboxObjc
//
//  Created by Alejandro on 02/06/15.
//  Copyright (c) 2015 Jukebox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface NetworkTask : NSObject

typedef void (^NetworkTaskSuccessBlock)(NetworkTask *task, id data);
typedef void (^NetworkTaskFailureBlock)(NetworkTask *task, NSError *error);

@property (nonatomic, strong, readonly) NSMutableArray *successBlocks;
@property (nonatomic, strong, readonly) NSMutableArray *failureBlocks;

@property (nonatomic) NSInteger statusCode;

- (void)finishTaskWithError:(NSError *)error;
- (void)finishTaskWithData:(id)data;

- (void)addSuccessBlock:(NetworkTaskSuccessBlock)successBlock;
- (void)addFailureBlock:(NetworkTaskFailureBlock)failureBlock;

@end