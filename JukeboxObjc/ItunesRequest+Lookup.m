//
//  iTunesRequest+Lookup.m
//  JukeboxObjc
//
//  Created by Alejandro on 02/06/15.
//  Copyright (c) 2015 Jukebox. All rights reserved.
//

#import "ItunesRequest.h"
#import "ItunesRequest+Lookup.h"

static NSString * const kLookupEndpoint = @"/lookup";

@implementation ItunesRequest (Lookup)

- (NetworkTask *)lookupById:(NSInteger)identifier entity:(NSString *)entity media:(NSString *)media limit:(NSInteger)limit {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters = @{
        @"id": [NSNumber numberWithInteger: identifier],
        @"entity": entity,
        @"media": media,
        @"limit": [NSNumber numberWithInteger: limit]
    };
    
    NetworkTask * task = [[NetworkTask alloc] init];
    
    NSString * path = [[NSString alloc] initWithFormat: @"%@%@", self.apiRoot, kLookupEndpoint];
    
    [manager POST:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [task finishTaskWithData:responseObject];
        [task setStatusCode:[[operation response] statusCode]];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [task finishTaskWithError:error];
        [task setStatusCode:[[operation response] statusCode]];
    }];
     
    return task;
}

@end
