//
//  ViewController.m
//  JukeboxObjc
//
//  Created by Alejandro on 01/06/15.
//  Copyright (c) 2015 Jukebox. All rights reserved.
//

#import "CollectionViewController.h"
#import "UIImage+Cache.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self loadData];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadData {
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"artistCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
//    let collection = self.collections[indexPath.row]
//    
//    let image = UIImage.loadImageFromUrlWithCache(NSURL(string: collection.recentAlbum()!.artworkUrl)!)
//    
//    cell?.textLabel?.text = collection.artist.artistName
//    cell?.detailTextLabel?.text = "\(collection.albums.count) albums"
//    cell?.imageView?.image = image
//    
//    // What we are doing here could take more time than expected
//    // so lets process our image without blocking
//    dispatch_async(dispatch_get_main_queue()) {
//        // Styling form image color palette
//        let palette = image.colorArt(CGSize(width: 100, height: 100))
//        cell?.backgroundColor = palette?.backgroundColor
//        cell?.textLabel?.textColor = palette?.primaryColor.colorWithAlphaComponent(0.7)
//        cell?.detailTextLabel?.textColor = palette?.detailColor.colorWithAlphaComponent(0.7)
//    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


@end
