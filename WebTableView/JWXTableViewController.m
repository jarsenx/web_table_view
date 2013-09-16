//
//  JWXTableViewController.m
//  WebTableView
//
//  Created by Joseph Arsenault on 9/13/13.
//  Copyright (c) 2013 JoeWorx. All rights reserved.
//

#import "JWXTableViewController.h"
#import "JWXViewController.h"
#import "AFNetworking.h"

@implementation JWXTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.googlePlacesArrayFromAFNetworking = [[NSArray alloc] init];
    [self makeRestaurantRequests];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - AFNetworking

- (void)makeRestaurantRequests
{
    NSURL *url = [NSURL URLWithString:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=39.400666,-76.604478&radius=500&types=restaurant&sensor=false&key=INSERT_YOUR_KEY"];

    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //AFNetworking asynchronous url request
    AFJSONRequestOperation *operation = [AFJSONRequestOperation
                                         JSONRequestOperationWithRequest:request
                                         success:^(NSURLRequest *request, NSHTTPURLResponse *response, id responseObject)
                                         {
                                             self.googlePlacesArrayFromAFNetworking = [responseObject objectForKey:@"results"];
                                             [self.tableView reloadData];
                                         }
                                         failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id responseObject)
                                         {
                                             NSLog(@"Request Failed: %@, %@", error, error.userInfo);
                                         }
                                        ];
    [operation start];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.googlePlacesArrayFromAFNetworking count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSDictionary *tempDictionary = [self.googlePlacesArrayFromAFNetworking objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [tempDictionary objectForKey:@"name"];
    
    if([tempDictionary objectForKey:@"rating"] != NULL)
    {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Rating: %@ of 5", [tempDictionary objectForKey:@"rating"]];
    }
    else
    {
        cell.detailTextLabel.text = [NSString stringWithFormat:@"Not Rated"];
    }
    
    return cell;
}

#pragma mark - Prepare For Seque

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    JWXViewController *detailViewController = (JWXViewController *)segue.destinationViewController;
    detailViewController.restaurantDetail = [self.googlePlacesArrayFromAFNetworking objectAtIndex:indexPath.row];
}

@end
