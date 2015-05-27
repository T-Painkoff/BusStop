//
//  ViewController.m
//  BusStop
//
//  Created by Travis  on 5/27/15.
//  Copyright (c) 2015 Travis . All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "TableViewController.h"

@interface ViewController () <MKMapViewDelegate>


@property MKPointAnnotation *busStopAnnotation;
@property CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
//    double latitude = 41.89323984;
//    double longitude =87.63532979;
//




}

-(void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender {

}

- (IBAction)segmentedControlTapped:(id)sender {
    UISegmentedControl *seg = sender;
    if (seg.selectedSegmentIndex == 1) {
        [self performSegueWithIdentifier:@"segueList" sender:self];
    }
}


@end
