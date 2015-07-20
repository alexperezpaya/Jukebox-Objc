//
//  NSDate+iTunes.m
//  JukeboxObjc
//
//  Created by Alejandro on 03/06/15.
//  Copyright (c) 2015 Jukebox. All rights reserved.
//

#import "NSDate+iTunes.h"

@implementation NSDate (iTunes)

+(NSDate *)dateFromItunesString:(NSString *)dateString {
    NSDateFormatter * dateFormater = [[NSDateFormatter alloc] init];
    dateFormater.dateFormat = @"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'";
    return [dateFormater dateFromString:dateString];
}

@end
