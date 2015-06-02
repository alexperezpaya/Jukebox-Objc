//
//  iTunesRequest.h
//  JukeboxObjc
//
//  Created by Alejandro on 02/06/15.
//  Copyright (c) 2015 Jukebox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItunesRequest : NSObject

+(id)sharedInstance;
-(NSString *)apiRoot;

@end