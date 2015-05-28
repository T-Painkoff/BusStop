//

//  ViewController.m

//  BusStop

//

//  Created by Travis  on 5/27/15.

//  Copyright (c) 2015 Travis . All rights reserved.

//

//



#import "ViewController.h"



#import "TableViewController.h"



#import <MapKit/MapKit.h>







@interface ViewController () <MKMapViewDelegate>

@property MKPointAnnotation *busStopAnnotation;
@property CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property NSArray *busStop;
@property NSDictionary *tempDictionary;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    [self createBusStop];
    [self addAnnotationToMapView];
}

-(void)addAnnotationToMapView {

    for (NSDictionary *stops in self.busStop) {

        MKPointAnnotation *annotation = [MKPointAnnotation new];
        double latitude = [[stops objectForKey:@"latitude"] doubleValue];
        double longitude = [[stops objectForKey:@"longitude"] doubleValue];
        self.tempDictionary = stops;
        annotation.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
        annotation.title = [stops objectForKey:@"cta_stop_name"];
        [self.mapView addAnnotation:annotation];



        [self.mapView viewForAnnotation:annotation];



    }



}



//-(IBAction)searchButtonPressed:(id)sender {

//    NSString *searchString = [NSString stringWithFormat:@"%@", self.searchTextField.text];

//    CLGeocoder *geocoder = [CLGeocoder new];

//    [geocoder geocodeAddressString:searchString completionHandler:^(NSArray *placemarks, NSError *error) {

//        for (CLPlacemark *place in placemarks) {

//            MKPointAnnotation *annotation = [MKPointAnnotation new];

//            annotation.coordinate = place.location.coordinate;

//            annotation.title = place.name;

//        [self.mapView addAnnotation:annotation];

//        }

//    }];

//

//}



-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {



    MKPinAnnotationView *pin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:nil];



    if ([[self.tempDictionary objectForKey:@"inter_modal"]  isEqualToString:@"Pace"]) {

        pin.pinColor = MKPinAnnotationColorGreen;

    }

    else if ([[self.tempDictionary objectForKey:@"inter_modal"]  isEqualToString:@"Metra"]){

        pin.pinColor = MKPinAnnotationColorPurple;

    }

    pin.canShowCallout = YES;



    pin.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];



    return pin;



}







-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {







    CLLocationCoordinate2D centerCoordinate = view.annotation.coordinate;







    MKCoordinateSpan span;



    span.latitudeDelta = 0.01;



    span.longitudeDelta = 0.01;







    MKCoordinateRegion region;



    region.center = centerCoordinate;



    region.span = span;







    [self.mapView setRegion:region animated:YES];



}







-(void)createBusStop {



    self.busStop = [NSArray new];







    NSURL *url = [NSURL URLWithString:@"https://s3.amazonaws.com/mobile-makers-lib/bus.json"];




    
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
    
    
    
    
    
    
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        
        
        
        
        
        NSDictionary *stopInfo = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];
        
        
        
        
        
        
        
        self.busStop = [stopInfo objectForKey:@"results"];
        
        
        
    }];
    
    
    
}







-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    
    
    
    
    
}











@end



