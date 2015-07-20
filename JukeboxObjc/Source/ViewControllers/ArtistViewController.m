//
//  ArtistViewController.m
//  JukeboxObjc
//
//  Created by Alejandro on 04/06/15.
//  Copyright (c) 2015 Jukebox. All rights reserved.
//

#import "ArtistViewController.h"

@implementation ArtistViewController

- (void)viewDidLoad {
    self.title = self.collection.artist.artistName;
    self.navigationController.title = self.collection.artist.artistName;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.collection.albums count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"albumCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    Album * album = self.collection.sortedAlbums[indexPath.row];
    
    UIImage *image = [UIImage loadImageURLWithCache:album.artworkUrl];
    
    [cell.textLabel setText:album.collectionName];
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"%i tracks", (int)album.trackCount]];
    [cell.imageView setImage:image];
    
    // What we are doing here could take more time than expected
    // so lets process our image without blocking
    dispatch_async(dispatch_get_main_queue(), ^{
        SLColorArt * palette = [image colorArt:CGSizeMake(100, 100)];
        cell.backgroundColor = palette.backgroundColor;
        cell.textLabel.textColor = [palette.primaryColor colorWithAlphaComponent:0.7];
        cell.detailTextLabel.textColor = [palette.secondaryColor colorWithAlphaComponent:0.7];
    });
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
