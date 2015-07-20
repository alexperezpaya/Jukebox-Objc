//
//  AlbumCollection.h
//  JukeboxObjc
//
//  Created by Alejandro on 03/06/15.
//  Copyright (c) 2015 Jukebox. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Artist.h"
#import "Album.h"

@interface AlbumCollection : NSObject

@property (nonatomic, strong) NSMutableArray * albums;
@property (nonatomic, strong) Artist * artist;

- (Album *)recentAlbum;
- (NSArray *)sortedAlbums;

@end
