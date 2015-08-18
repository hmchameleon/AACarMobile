//
//  MyAnnotation.h
//  AACarMobile
//
//  Created by Develop on 13.08.15.
//  Copyright (c) 2015 Develop. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyAnnotation : NSObject <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

-(id)initWithTitle:(NSString *)newTitle Subtitle:(NSString *)subtitle Location:(CLLocationCoordinate2D)location;
//-(MKAnnotationView *)annotationView;

@end
