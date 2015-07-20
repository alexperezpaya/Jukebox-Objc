//
//  AlbumCollection.m
//  JukeboxObjc
//
//  Created by Alejandro on 03/06/15.
//  Copyright (c) 2015 Jukebox. All rights reserved.
//

#import "AlbumCollection.h"

@implementation AlbumCollection

- (id)init {
    self = [super init];
    if (self)
    {
        _albums = [NSMutableArray array];
    }
    return self;
}

- (NSArray *)sortedAlbums {
    NSArray * unsortedAlbums = [self.albums copy]; // Avoid mutability
    NSArray * sortedAlbums = [unsortedAlbums sortedArrayUsingComparator:^NSComparisonResult(Album * left, Album * right) {
        return [left.releaseDate compare:right.releaseDate] == NSOrderedAscending;
    }];
    return sortedAlbums;
}

- (Album *)recentAlbum {
    return [[self sortedAlbums] firstObject];
}

@end
