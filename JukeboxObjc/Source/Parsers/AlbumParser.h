//
//  AlbumParser.h
//  JukeboxObjc
//
//  Created by Alejandro on 03/06/15.
//  Copyright (c) 2015 Jukebox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Album.h"

@interface AlbumParser : NSObject
- (Album *)parseWithJson:(NSDictionary *)json;
@end
