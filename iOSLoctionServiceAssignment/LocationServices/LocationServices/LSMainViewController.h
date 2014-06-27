//
//  LSMainViewController.h
//  LocationServices
//
//  Created by bipul on 5/19/14.
//  Copyright (c) 2014 bipul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSGeoCodeViewController.h"
#import "LSLocationMgrViewController.h"

@interface LSMainViewController: UIViewController
{
   // LSGeoCodeViewController *geoCodeView;
    //LSLocationMgrViewController *locationMgrView;
    UITextField *street;
    UITextField *city;
    UITextField  *zip;
}


@property (nonatomic, retain) IBOutlet UITextField *street;
@property (nonatomic, retain) IBOutlet UITextField *city;
@property (nonatomic, retain) IBOutlet UITextField *zip;
//@property (nonatomic, retain) IBOutlet LSGeoCodeViewController *geoCodeView;
//@property (nonatomic, retain) IBOutlet LSLocationMgrViewController *locationMgrView;

- (IBAction)backgroundTouchedHideKeyboard:(id)sender;


@end
