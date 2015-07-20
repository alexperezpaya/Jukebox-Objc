//
//  CollectionViewController.h
//  JukeboxObjc
//
//  Created by Alejandro on 01/06/15.
//  Copyright (c) 2015 Jukebox. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ArtistViewController.h"

#import "AlbumCollectionManager.h"
#import "AlbumCollection.h"

#import "UIImage+Cache.h"

#import <ColorArt/UIImage+ColorArt.h>
#import <SVProgressHUD/SVProgressHUD.h>

@interface CollectionViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) AlbumCollectionManager * manager;

@end

