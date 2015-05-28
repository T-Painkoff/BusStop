//
//  DetailViewController.m
//  BusStop
//
//  Created by Travis  on 5/27/15.
//  Copyright (c) 2015 Travis . All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameLabel.text = [self.dictionary objectForKey:@"cta_stop_name"];
    self.routesLabel.text = [self.dictionary objectForKey:@"routes"];
    self.addressLabel.text = [self.dictionary objectForKey:@"_address"];
    self.transferLabel.text = [self.dictionary objectForKey:@"inter_modal"];

}








/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
