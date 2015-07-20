//
//  ArtistParser.h
//  JukeboxObjc
//
//  Created by Alejandro on 03/06/15.
//  Copyright (c) 2015 Jukebox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Artist.h"

@interface ArtistParser : NSObject
- (Artist *)parseWithJson:(NSDictionary *)json;
@end
