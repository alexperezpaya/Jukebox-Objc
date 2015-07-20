//
//  NSDate+iTunes.h
//  JukeboxObjc
//
//  Created by Alejandro on 03/06/15.
//  Copyright (c) 2015 Jukebox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (iTunes)

+ (NSDate *)dateFromItunesString:(NSString *)dateString;

@end
