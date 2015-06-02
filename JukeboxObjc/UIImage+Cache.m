//
//  UIImage+Cache.m
//  JukeboxObjc
//
//  Created by Alejandro on 01/06/15.
//  Copyright (c) 2015 Jukebox. All rights reserved.
//

#import "UIImage+Cache.h"
#import "SDImageCache.h"

@implementation UIImage (Cache)

+ (UIImage *)loadImageURLWithCache:(NSURL *)url {
    SDImageCache *cache = [[SDImageCache alloc] init];
    UIImage *image;
    if ((image = [cache imageFromMemoryCacheForKey:[url absoluteString]])) {
        return image;
    }
    
    if ((image = [cache imageFromDiskCacheForKey:[url absoluteString]])) {
        return image;
    }
    
    image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
    [cache storeImage:image forKey:[url absoluteString] toDisk:YES];

    return image;

}

@end
