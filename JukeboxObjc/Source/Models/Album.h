//
//  Album.h
//  JukeboxObjc
//
//  Created by Alejandro on 01/06/15.
//  Copyright (c) 2015 Jukebox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Album : NSObject

@property (nonatomic) NSInteger artistId;
@property (nonatomic, copy) NSString * artistName;
@property (nonatomic, copy) NSString * collectionName;
@property (nonatomic, copy) NSURL * artworkUrl;
@property (nonatomic, copy) NSNumber * collectionPrice;
@property (nonatomic) NSInteger trackCount;
@property (nonatomic, copy) NSDate * releaseDate;

@end
