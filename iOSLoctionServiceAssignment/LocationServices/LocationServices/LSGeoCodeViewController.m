//
//  LSFirstViewController.m
//  LocationServices
//
//  Created by bipul on 5/19/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "LSGeoCodeViewController.h"

@interface LSGeoCodeViewController ()

@end

@implementation LSGeoCodeViewController
@synthesize mapView;
@synthesize streetAdd, cityName, zipCode;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //self.mapView.delegate = self;
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    //NSString *addressString = [NSString stringWithFormat:@"%@ %@ %@", @"2408 E Cromwell Ave",@"Fresno", @"93720"];
    NSString *addressString = [NSString stringWithFormat:@"%@ %@ %@", streetAdd,cityName,zipCode];
    NSLog(@"street address: %@", streetAdd);
    NSLog(@"city name: %@", cityName);
    NSLog(@"zip code: %@", zipCode);
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

/*
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    //Add an annotation
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.title = @"where am I?";
    point.subtitle =@"You're here!";
    [self.mapView addAnnotation:point];
}
*/


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
