//
//  Json.m
//  BusStop
//
//  Created by Travis  on 5/27/15.
//  Copyright (c) 2015 Travis . All rights reserved.
//

#import "BusStop.h"



@implementation BusStop


-(void)viewDidLoad {
    self.busStop = [NSArray new];

    NSURL *url = [NSURL URLWithString:@"https://s3.amazonaws.com/mobile-makers-lib/bus.json"];

    NSURLRequest *request = [NSURLRequest requestWithURL: url];

    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *stopInfo = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];

        self.busStop = [stopInfo objectForKey:@"results"];

        [self.busStopTableView reloadData];
    }];


}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.busStop.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"busCell"];
                             NSDictionary *stopInfo = [self.busStop objectAtIndex:indexPath.row];
                             cell.textLabel.text = [stopInfo objectForKey:@"name"];

    return cell;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
