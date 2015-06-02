//
//  Album.h
//  JukeboxObjc
//
//  Created by Alejandro on 01/06/15.
//  Copyright (c) 2015 Jukebox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Album : NSObject

@property (nonatomic, readonly) NSInteger * artistId;
@property (nonatomic, copy, readonly) NSString * artistName;
@property (nonatomic, copy, readonly) NSString * collectionName;
@property (nonatomic, copy, readonly) NSString * artworkUrl;
@property (nonatomic, copy, readonly) NSNumber *collectionPrice;
@property (nonatomic, readonly) NSInteger *trackCount;
@property (nonatomic, copy, readonly) NSDate *releaseData;

@end
