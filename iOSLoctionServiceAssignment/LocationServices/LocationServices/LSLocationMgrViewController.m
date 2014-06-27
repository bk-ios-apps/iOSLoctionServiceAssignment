//
//  LSSecondViewController.m
//  LocationServices
//
//  Created by bipul on 5/19/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "LSLocationMgrViewController.h"

@interface LSLocationMgrViewController ()

@end

@implementation LSLocationMgrViewController
@synthesize mapView;
@synthesize latitude, longitude, altitude;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    _locationManager.delegate = self;
    if ([CLLocationManager locationServicesEnabled]) {
    [_locationManager startMonitoringSignificantLocationChanges]; // not as accurate but saves battery
    _startLocation = nil; // location tracking has just begun at this location so this is set to nil.
    } else {
        NSLog(@"Location services not enabled.");
    }
    // map kit
    NSString *addressString = [NSString stringWithFormat:@"%@", _startLocation];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    
    [geocoder geocodeAddressString:addressString completionHandler:^(NSArray *placemarks, NSError *error)
     {
         if(error)
         {
             NSLog(@"Geocode failed with error: %@", error);
             return;
         }
         if(placemarks && placemarks.count > 0)
         {
             CLPlacemark *placemark = placemarks[0];
             CLLocation *location = placemark.location;
             _coords = location.coordinate;
             //MKCoordinateSpan span = MKCoordinateSpanMake(0.2, 0.2);
             MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(_coords, 1600, 1600);
             [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
             //Add an annotation
             MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
             [point setCoordinate:_coords];
             [point setTitle:@"You Entered this Address!"];
             [self.mapView addAnnotation:point];
             //[self mapView];
         }
         
     }];
    

}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error {
    NSLog(@"Received Core Location error %@", error);
    [manager stopUpdatingLocation];
}


-(void)locationManager:(CLLocationManager *)manager
   didUpdateToLocation:(CLLocation *)newLocation
          fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"Moved from %@ to %@", oldLocation, newLocation);
    latitude = [[NSString alloc]
                                 initWithFormat:@"%+.6f",
                                 newLocation.coordinate.latitude];
    longitude = [[NSString alloc]
                                  initWithFormat:@"%+.6f",
                                  newLocation.coordinate.longitude];
    altitude = [[NSString alloc]
                                 initWithFormat:@"%+.6f",
                                 newLocation.altitude];

    if (_startLocation == nil)
        _startLocation = newLocation;
    
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
