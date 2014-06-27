//
//  LSMainViewController.m
//  LocationServices
//
//  Created by bipul on 5/19/14.
//  Copyright (c) 2014 bipul. All rights reserved.
//

#import "LSMainViewController.h"

@interface LSMainViewController ()

@end

@implementation LSMainViewController
@synthesize street, city, zip;
//@synthesize geoCodeView, locationMgrView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"pushToGeoCode"])
    {
        LSGeoCodeViewController *gvc = segue.destinationViewController;
        gvc.streetAdd = self.street.text;
        gvc.cityName = self.city.text;
        gvc.zipCode = self.zip.text;
        self.street.text = @" ";
        self.city.text = @" ";
        self.zip.text = @" ";
    }
    if([segue.identifier isEqualToString:@"pushToLocationMgr"])
    {
        self.street.text = @" ";
        self.city.text = @" ";
        self.zip.text = @" ";
       
    }
}

-(void)backgroundTouchedHideKeyboard:(id)sender
{
    [street resignFirstResponder];
    [city resignFirstResponder];
    [zip resignFirstResponder];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
