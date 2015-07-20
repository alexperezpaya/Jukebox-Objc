//
//  LookupAlbumInteractor.h
//  JukeboxObjc
//
//  Created by Alejandro on 02/06/15.
//  Copyright (c) 2015 Jukebox. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "iTunesRequest+Lookup.h"
#import "NetworkTask.h"

#import "AlbumCollection.h"

#import "AlbumParser.h"
#import "ArtistParser.h"

@interface LookupAlbumInteractor : NSObject

typedef void (^LookupAlbumInteractorSuccess)(AlbumCollection *albumCollection);
typedef void (^LookupAlbumInteractorFailure)(NetworkTask *task, NSError *error);

- (void)lookupById:(NSInteger)identifier
             limit:(NSInteger)limit
      successBlock:(LookupAlbumInteractorSuccess)successBlock
      failureBlock:(LookupAlbumInteractorFailure)failureBlock;

@end
