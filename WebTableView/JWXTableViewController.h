//
//  JWXTableViewController.h
//  WebTableView
//
//  Created by Joseph Arsenault on 9/13/13.
//  Copyright (c) 2013 JoeWorx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JWXTableViewController : UITableViewController <UITableViewDataSource>

@property (strong, nonatomic) NSArray *googlePlacesArrayFromAFNetworking;
@property (strong, nonatomic) NSArray *finishedGooglePlacesArray;

@end
