//
//  MapViewController.m
//  AACarMobile
//
//  Created by Develop on 12.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "MapViewController.h"
#import "MyAnnotation.h"

@implementation MapViewController
{
    Seller *_seller;
    MyAnnotation *_ma;
}

@synthesize mapView;

-(void) viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    CLLocationCoordinate2D crdAnnotation = CLLocationCoordinate2DMake([_seller.coordinates[0] doubleValue],[_seller.coordinates[1] doubleValue] );
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta=0.02;
    span.longitudeDelta=0.02;
    region.center = crdAnnotation;
    region.span = span;
    [mapView setRegion:region animated:TRUE];
    [mapView regionThatFits:region];
    
    _ma = [[MyAnnotation alloc] initWithTitle:_seller.company Subtitle:_seller.address Location:crdAnnotation];
    [mapView addAnnotation:_ma];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [mapView removeAnnotation:_ma];
}

-(void)setAnnotation:(Seller *)seller
{
    _seller = seller;
}

/*-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MyAnnotation class]])
    {
        MyAnnotation *ma = (MyAnnotation *)annotation;
        MKAnnotationView *av = [mapView dequeueReusableAnnotationViewWithIdentifier:@"MyAnnotation"];
        if(!av)
        {
            av = ma.annotationView;
        }
        else
        {
            av.annotation = annotation;
        }
        return av;
    }
    else
        return nil;
}*/

@end

