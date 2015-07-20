//
//  iTunesRequest+Lookup.h
//  JukeboxObjc
//
//  Created by Alejandro on 02/06/15.
//  Copyright (c) 2015 Jukebox. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NetworkTask.h"
#import "ItunesRequest.h"

@interface ItunesRequest (Lookup)

- (NetworkTask *)lookupById:(NSInteger)id
                     entity:(NSString *)entity
                      media:(NSString *)media
                      limit:(NSInteger)limit;
@end
