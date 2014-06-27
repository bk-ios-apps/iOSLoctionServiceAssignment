//
//  LSFirstViewController.h
//  LocationServices
//
//  Created by bipul on 5/19/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <AddressBook/AddressBook.h>

@interface LSGeoCodeViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet NSString *streetAdd;
@property (strong, nonatomic) IBOutlet NSString *cityName;
@property (strong, nonatomic) IBOutlet NSString *zipCode;
@property CLLocationCoordinate2D coords;


@end
