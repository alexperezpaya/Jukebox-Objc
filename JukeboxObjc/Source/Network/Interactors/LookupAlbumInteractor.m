//
//  LookupAlbumInteractor.m
//  JukeboxObjc
//
//  Created by Alejandro on 02/06/15.
//  Copyright (c) 2015 Jukebox. All rights reserved.
//

#import "LookupAlbumInteractor.h"
#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@implementation LookupAlbumInteractor

- (void)lookupById:(NSInteger)identifier
             limit:(NSInteger)limit
      successBlock:(LookupAlbumInteractorSuccess)successBlock
      failureBlock:(LookupAlbumInteractorFailure)failureBlock
{
    NetworkTask * task = [[ItunesRequest sharedInstance] lookupById:identifier entity:@"album" media:@"music" limit:limit];
    [task addSuccessBlock:^(NetworkTask *task, id data) {

        AlbumCollection *collection = [[AlbumCollection alloc] init];

        AlbumParser * albumParser = [[AlbumParser alloc] init];
        ArtistParser * artistParser = [[ArtistParser alloc] init];

        NSArray * entities = data[@"results"];
        
        for (NSDictionary * entity in entities) {
            // OBJC does not support string switches :(
            NSString *entityType = entity[@"wrapperType"];

            if ([entityType isEqualToString:@"collection"]) {
                [collection.albums addObject:[albumParser parseWithJson:entity]];
            } else if ([entityType isEqualToString:@"artist"]) {
                collection.artist = [artistParser parseWithJson:entity];
            } else {
                NSLog(@"Unknown type");
            }

        }

        successBlock(collection);

    }];

    [task addFailureBlock:^(NetworkTask *task, NSError *error) {
        failureBlock(task, error);
    }];

}

@end
