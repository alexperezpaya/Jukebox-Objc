//
//  ViewController.m
//  JukeboxObjc
//
//  Created by Alejandro on 01/06/15.
//  Copyright (c) 2015 Jukebox. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    _manager = [[AlbumCollectionManager alloc] initWithSearches:@[
                                                                  @[@148662, @10],
                                                                  @[@6906197, @20],
                                                                  @[@16252655, @7]
                                                                ]];
    UITableView * tableView = self.tableView; // Better than weakifiying
    [self.manager addUpdateCallback:^(NSArray *collections) {
        [SVProgressHUD dismiss];
        [tableView reloadData];
    }];
    
    [self loadData];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadData {
    [SVProgressHUD showInfoWithStatus:@"Loading your library..."];
    [self.manager fetch];
}

#pragma mark - Table View Implementation

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"artistCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    AlbumCollection * collection = [self.manager.collections objectAtIndex:indexPath.row];
    
    Album * recentAlbum = [collection recentAlbum];
    
    UIImage * image = [UIImage loadImageURLWithCache:recentAlbum.artworkUrl];
    
    [cell.textLabel setText:collection.artist.artistName];
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"%i albums", (int)[collection.albums count]]];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.manager.collections count];
}

#pragma mark - Segue implementation

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"showArtistCollection" sender:indexPath];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showArtistCollection"]) {
        NSIndexPath * indexPath = sender;
        ArtistViewController * artistViewController = segue.destinationViewController;
        AlbumCollection * collection = self.manager.collections[indexPath.row];
        artistViewController.collection = collection;
    }
}

@end
