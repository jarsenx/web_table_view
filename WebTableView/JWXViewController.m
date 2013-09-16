//
//  JWXViewController.m
//  WebTableView
//
//  Created by Joseph Arsenault on 9/13/13.
//  Copyright (c) 2013 JoeWorx. All rights reserved.
//

#import "JWXViewController.h"
#import "AFNetworking.h"

@interface JWXViewController ()

@end

@implementation JWXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.restaurantNameLabel.text = [self.restaurantDetail objectForKey:@"name"];
    [self.restaurantImageView setImageWithURL:[NSURL URLWithString:[self.restaurantDetail objectForKey:@"icon"]] placeholderImage:[UIImage imageNamed:@"default"]];
    self.restaurantAddressView.text = [self.restaurantDetail objectForKey:@"vicinity"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
