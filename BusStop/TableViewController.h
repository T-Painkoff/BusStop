//
//  Json.h
//  BusStop
//
//  Created by Travis  on 5/27/15.
//  Copyright (c) 2015 Travis . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property NSArray *busStop;

@property (weak,nonatomic) IBOutlet UITableView *busStopTableView;
@property NSIndexPath *path;


@end


