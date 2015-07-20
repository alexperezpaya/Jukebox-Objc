//
//  AlbumCollectionManager.m
//  JukeboxObjc
//
//  Created by Alejandro on 03/06/15.
//  Copyright (c) 2015 Jukebox. All rights reserved.
//

#import "AlbumCollectionManager.h"
#import "LookupAlbumInteractor.h"

@implementation AlbumCollectionManager

- (instancetype)initWithSearches:(NSArray *)searches {
    self = [super init];
    if (self)
    {
        _searches = [searches copy];
        _updateCallbacks = [NSMutableArray array];
    }
    return self;
}

- (void)addUpdateCallback:(UpdateCallback)updateCallback {
    [_updateCallbacks addObject:updateCallback];
}

- (void)callUpdateCallbacks {
    for (UpdateCallback cb in _updateCallbacks) {
        cb(self.collections);
    }
}

- (void)fetch {
    _collections = [NSMutableArray array]; // We are fetching this again so we restart last collection
    
    for (NSArray * search in _searches) {
        NSInteger identifier = [search[0] integerValue];
        NSInteger limit = [search[1] integerValue];
        [self fetchById:identifier limit:limit];
    }
    
}

- (void)fetchById:(NSInteger)identifier limit:(NSInteger)limit {
    LookupAlbumInteractor * interactor = [[LookupAlbumInteractor alloc] init];
    [interactor lookupById:identifier limit:limit successBlock:^(AlbumCollection * albumCollection) {
        [_collections addObject:albumCollection];
        [self callUpdateCallbacks];
    } failureBlock:^(NetworkTask * task, NSError * error) {
        // Retry request on failure
        [self fetchById:identifier limit:limit];
    }];
}

@end
