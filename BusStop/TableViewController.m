//
//  Json.m
//  BusStop
//
//  Created by Travis  on 5/27/15.
//  Copyright (c) 2015 Travis . All rights reserved.
//

#import "TableViewController.h"
#import "DetailViewController.h"

@implementation TableViewController


-(void)viewDidLoad {
    self.busStop = [NSArray new];

    NSURL *url = [NSURL URLWithString:@"https://s3.amazonaws.com/mobile-makers-lib/bus.json"];

    NSURLRequest *request = [NSURLRequest requestWithURL: url];

    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *stopInfo = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];

        self.busStop = [stopInfo objectForKey:@"row"];

        [self.busStopTableView reloadData];
    }];


}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.busStop.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"busCell"];
    NSDictionary *stop = [self.busStop objectAtIndex:indexPath.row];
    cell.textLabel.text = [stop objectForKey:@"cta_stop_name"];
    cell.detailTextLabel.text = [stop objectForKey:@"routes"];
   

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.path = indexPath;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(NSDictionary*)sender{

    DetailViewController *detailVC = [segue destinationViewController];
    detailVC.dictionary = [self.busStop objectAtIndex:self.path.row];


}
@end
