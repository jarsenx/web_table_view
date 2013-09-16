//
//  JWXViewController.h
//  WebTableView
//
//  Created by Joseph Arsenault on 9/13/13.
//  Copyright (c) 2013 JoeWorx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JWXViewController : UIViewController

@property (strong, nonatomic) NSDictionary *restaurantDetail;
@property (strong, nonatomic) IBOutlet UILabel *restaurantNameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *restaurantImageView;
@property (strong, nonatomic) IBOutlet UITextView *restaurantAddressView;

@end
