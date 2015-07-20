//
//  ArtistViewController.h
//  JukeboxObjc
//
//  Created by Alejandro on 04/06/15.
//  Copyright (c) 2015 Jukebox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "AlbumCollection.h"
#import "UIImage+Cache.h"
#import <ColorArt/UIImage+ColorArt.h>

@interface ArtistViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) AlbumCollection * collection;

@end
