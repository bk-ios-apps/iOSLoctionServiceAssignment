//
//  LSSecondViewController.h
//  LocationServices
//
//  Created by bipul on 5/19/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@interface LSLocationMgrViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) IBOutlet NSString *latitude;
@property (strong, nonatomic) IBOutlet NSString *longitude;
@property (strong, nonatomic) IBOutlet NSString *altitude;

@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *startLocation;
@property CLLocationCoordinate2D coords;



@end
