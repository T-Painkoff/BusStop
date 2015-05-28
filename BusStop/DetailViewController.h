//
//  DetailViewController.h
//  BusStop
//
//  Created by Travis  on 5/27/15.
//  Copyright (c) 2015 Travis . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property NSDictionary *dictionary;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *routesLabel;
@property (weak, nonatomic)  IBOutlet UILabel *addressLabel;
@property (weak, nonatomic)  IBOutlet UILabel *transferLabel;


@end
