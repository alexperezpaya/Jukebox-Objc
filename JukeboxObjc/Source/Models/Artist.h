//
//  Artist.h
//  JukeboxObjc
//
//  Created by Alejandro on 03/06/15.
//  Copyright (c) 2015 Jukebox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Artist : NSObject

@property (nonatomic, copy) NSString * artistType;
@property (nonatomic, copy) NSString * artistName;
@property (nonatomic) NSInteger artistId;
@property (nonatomic) NSInteger amgArtistId;
@property (nonatomic) NSInteger primaryGenreId;
@property (nonatomic, copy) NSString * primaryGenreName;

@end
