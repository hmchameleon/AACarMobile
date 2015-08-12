//
//  MapViewController.m
//  AACarMobile
//
//  Created by Develop on 12.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "MapViewController.h"

@implementation MapViewController

@synthesize mapView;

-(void) viewDidLoad
{
    [super viewDidLoad];
    /*CLLocationCoordinate2D kirov = CLLocationCoordinate2DMake(58.5855414, 49.670926);
    [mapView setCenterCoordinate:kirov];
    mapView.visibleMapRect = MKMapRectMake(kirov.latitude-5.0, kirov.longitude-5.0, 10.0, 10.0);
    */
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta=0.2;
    span.longitudeDelta=0.2;
    CLLocationCoordinate2D location;
    location.latitude = 58.5855414;
    location.longitude =49.670926;
    region.center = location;
    region.span = span;
    [mapView setRegion:region animated:TRUE];
    [mapView regionThatFits:region];
}

@end
