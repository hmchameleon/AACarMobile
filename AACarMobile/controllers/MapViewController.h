//
//  MapViewController.h
//  AACarMobile
//
//  Created by Develop on 12.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Seller.h"

@interface MapViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic,weak) IBOutlet MKMapView *mapView;

-(void)setAnnotation:(Seller *)seller;

@end
