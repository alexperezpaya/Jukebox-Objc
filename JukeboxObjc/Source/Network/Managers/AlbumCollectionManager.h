//
//  AlbumCollectionManager.h
//  JukeboxObjc
//
//  Created by Alejandro on 03/06/15.
//  Copyright (c) 2015 Jukebox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlbumCollectionManager : NSObject

typedef void (^UpdateCallback)(NSArray * collections);

@property (nonatomic, strong) NSMutableArray * searches;
@property (nonatomic, readonly) NSMutableArray * collections;
@property (nonatomic, strong) NSMutableArray * updateCallbacks;

- (instancetype)initWithSearches:(NSArray *)searches;

- (void)fetch;
- (void)addUpdateCallback:(UpdateCallback)updateCallback;

@end
