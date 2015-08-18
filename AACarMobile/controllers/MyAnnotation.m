//
//  MyAnnotation.m
//  AACarMobile
//
//  Created by Develop on 13.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation

-(id)initWithTitle:(NSString *)newTitle Subtitle:(NSString *)subtitle Location:(CLLocationCoordinate2D)location
{
    self = [super init];
    
    if(self)
    {
        _title = newTitle;
        _coordinate = location;
        _subtitle = subtitle;
    }
    return self;
}

/*-(MKAnnotationView *)annotationView
{
    MKAnnotationView *av = [[MKAnnotationView alloc] initWithAnnotation:self reuseIdentifier:@"MyAnnotation"];
    av.enabled = YES;
    av.canShowCallout = YES;
    av.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    return av;
}*/

- (NSString *)title {
    return _title;
}

- (NSString *)subtitle {
    return _subtitle;
}

- (CLLocationCoordinate2D)coordinate {
    return _coordinate;
}

/*- (MKMapItem*)mapItem {
    NSDictionary *addressDict = @{};
    
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:self.coordinate addressDictionary:addressDict];
    
    MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
    mapItem.name = self.title;
    
    return mapItem;
}*/

@end
