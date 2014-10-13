//  MultiMapViewDemo.m
//  BaiduMapSdkSrc
//
//  Created by BaiduMapAPI on 13-7-24.
//  Copyright (c) 2013年 baidu. All rights reserved.
//

#import "MultiMapViewDemo.h"
@implementation MultiMapViewDemo
- (id)init
{
    self = [super init];
    
    if(self)
    {
        mapView1 = [[BMKMapView alloc]initWithFrame:CGRectMake(10, 3, 300, 200)];
        mapView1.mapType = BMKMapTypeSatellite;
        mapView1.zoomLevel = 14;
        [self.view addSubview:mapView1];
        [mapView1 release];
        UIView* splitline = [[UIView alloc]initWithFrame:CGRectMake(0, 206, 320, 2)];
        splitline.backgroundColor = [UIColor grayColor];
        [self.view addSubview:splitline];

        mapView2 = [[BMKMapView alloc]initWithFrame:CGRectMake(10, 212, 300, 200)];
        mapView2.mapType = BMKMapTypeStandard;
        mapView2.zoomLevel = 14;
        [self.view addSubview:mapView2];
        [mapView2 release];

        
    }
    
    return self;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //适配ios7
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
    {
                self.edgesForExtendedLayout=UIRectEdgeNone;
    }
}
-(void)viewWillAppear:(BOOL)animated {
    [mapView1 viewWillAppear];
    mapView1.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    [mapView2 viewWillAppear];
    mapView2.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    
}

-(void)viewWillDisappear:(BOOL)animated {
    [mapView1 viewWillDisappear];
    mapView1.delegate = nil; // 不用时，置nil
    [mapView2 viewWillDisappear];
    mapView2.delegate = nil; // 不用时，置nil
   
}
- (void)viewDidUnload {
    [super viewDidUnload];
}
- (void)dealloc {
    [super dealloc];
    if (mapView1) {
        [mapView1 release];
        mapView1 = nil;
    }
    if (mapView2) {
        [mapView2 release];
        mapView2 = nil;
    }
    
}


- (void)mapView:(BMKMapView *)mapView onClickedMapBlank:(CLLocationCoordinate2D)coordinate
{
    if(mapView==mapView1)
    {
        NSLog(@"mapview1-onClickedMapBlank");
    }
    else if(mapView==mapView2)
    {
        NSLog(@"mapview2-onClickedMapBlank");
    }
}
- (void)mapview:(BMKMapView *)mapView onDoubleClick:(CLLocationCoordinate2D)coordinate
{
    if(mapView==mapView1)
    {
        NSLog(@"mapview1-onDoubleClick");
    }
    else if(mapView==mapView2)
    {
        NSLog(@"mapview2-onDoubleClick");
    }

}
- (void)mapview:(BMKMapView *)mapView onLongClick:(CLLocationCoordinate2D)coordinate
{
    if(mapView==mapView1)
    {
        NSLog(@"mapview1-onLongClick");
    }
    else if(mapView==mapView2)
    {
        NSLog(@"mapview2-onLongClick");
    }
}

@end
