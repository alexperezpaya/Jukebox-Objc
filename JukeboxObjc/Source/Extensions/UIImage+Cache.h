//
//  UIImage+Cache.h
//  JukeboxObjc
//
//  Created by Alejandro on 01/06/15.
//  Copyright (c) 2015 Jukebox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Cache)

+ (UIImage *)loadImageURLWithCache:(NSURL *)url;

@end
