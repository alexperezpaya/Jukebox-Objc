//
//  AlbumParser.m
//  JukeboxObjc
//
//  Created by Alejandro on 03/06/15.
//  Copyright (c) 2015 Jukebox. All rights reserved.
//

#import "AlbumParser.h"
#import "NSDate+iTunes.h"

@implementation AlbumParser

- (Album *)parseWithJson:(NSDictionary *)json {
   
    Album * album = [[Album alloc] init];
    
    album.artistId = [json[@"artistId"] integerValue];
    album.artistName = json[@"artistName"];
    album.artworkUrl = [NSURL URLWithString:json[@"artworkUrl100"]];
    album.collectionName = json[@"collectionName"];
    album.collectionPrice = [NSNumber numberWithFloat:[json[@"collectionPrice"] floatValue]];
    album.trackCount = [json[@"trackCount"] integerValue];
    album.releaseDate = [NSDate dateFromItunesString:json[@"releaseDate"]];
    
    return album;
    
}

@end
