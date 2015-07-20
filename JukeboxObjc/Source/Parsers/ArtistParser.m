//
//  ArtistParser.m
//  JukeboxObjc
//
//  Created by Alejandro on 03/06/15.
//  Copyright (c) 2015 Jukebox. All rights reserved.
//

#import "ArtistParser.h"

@implementation ArtistParser
- (Artist *)parseWithJson:(NSDictionary *)json {
    
    Artist * artist = [[Artist alloc] init];
    
    artist.artistId = [json[@"artistId"] integerValue];
    artist.artistName = json[@"artistName"];
    artist.artistType = json[@"artistType"];
    artist.amgArtistId = [json[@"amgArtistId"] integerValue];
    artist.primaryGenreName = json[@"primaryGenreName"];
    artist.primaryGenreId = [json[@"primaryGenreId"] integerValue];
    
    return artist;
}
@end
