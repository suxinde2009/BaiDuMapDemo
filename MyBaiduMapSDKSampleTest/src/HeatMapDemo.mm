//  HeatMapDemo.m
//  BaiduMapSdkSrc
//
//  Created by BaiduMapAPI on 13-7-24.
//  Copyright (c) 2013年 baidu. All rights reserved.
//

#import "HeatMapDemo.h"
@implementation HeatMapDemo
- (id)init
{
    self = [super init];
    
    if(self)
    {
        //创建mapview
        mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, 320, 410)];
        mapView.mapType = BMKMapTypeStandard;
        mapView.zoomLevel = 12;
        [mapView setCenterCoordinate:CLLocationCoordinate2DMake(39.915, 116.403)];
        [self.view addSubview:mapView];
        [mapView release];
        
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
    //添加热力图按钮
    if(addHeatMapBtn==nil){
        addHeatMapBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        addHeatMapBtn.frame = CGRectMake(20, 20, 100, 30);
        [addHeatMapBtn setTitle:@"添加热力图" forState:UIControlStateNormal];
        [addHeatMapBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [addHeatMapBtn setBackgroundColor:[UIColor grayColor] ];
        [self.view addSubview:addHeatMapBtn];
        [addHeatMapBtn addTarget:self action:@selector(addHeatMap) forControlEvents:UIControlEventTouchUpInside];
    }
    //删除热力图按钮
    if(removeHeatMapBtn==nil){
        removeHeatMapBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        removeHeatMapBtn.frame = CGRectMake(180, 20, 100, 30);
        [removeHeatMapBtn setTitle:@"删除热力图" forState:UIControlStateNormal];
        [removeHeatMapBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [removeHeatMapBtn setBackgroundColor:[UIColor grayColor] ];
        [self.view addSubview:removeHeatMapBtn];
        [removeHeatMapBtn addTarget:self action:@selector(removeHeatMap) forControlEvents:UIControlEventTouchUpInside];
    }

    
}
-(void)viewWillAppear:(BOOL)animated {
    [mapView viewWillAppear];
    mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    [self.view bringSubviewToFront:addHeatMapBtn];
    [self.view bringSubviewToFront:removeHeatMapBtn];
    
}

-(void)viewWillDisappear:(BOOL)animated {
    [mapView viewWillDisappear];
    mapView.delegate = nil; // 不用时，置nil
}
- (void)viewDidUnload {
    [super viewDidUnload];
}
- (void)dealloc {
    [super dealloc];
    if (mapView) {
        [mapView release];
        mapView = nil;
    }
    
}
//添加热力图
-(void)addHeatMap{
    //创建热力图数据类
    
//    BMKHeatMap* heatMap = [[BMKHeatMap alloc]init];
//    //创建热力图数据数组
//    NSMutableArray* data = [NSMutableArray array];
//    int num = 1000;
//    for(int i = 0; i<num; i++)
//    {
//        //创建BMKHeatMapNode
//        BMKHeatMapNode* heapmapnode_test = [[BMKHeatMapNode alloc]init];
//        //随机生成点坐标
//        CLLocationCoordinate2D coor;
//        float random = (arc4random()%1000)*0.0001;
//        float random2 = (arc4random()%1000)*0.0001;
//        coor.latitude = 39.865+random;
//        coor.longitude = 116.353+random2;
//        heapmapnode_test.pt = coor;
//        //随机生成点强度
//        heapmapnode_test.intensity = arc4random()*900;
//        //添加BMKHeatMapNode到数组
//        [data addObject:heapmapnode_test];
//        [heapmapnode_test release];
//    }
//    //将点数据赋值到热力图数据类
//    heatMap.mData = data;
//    //调用mapView中的方法根据热力图数据添加热力图
//    [mapView addHeatMap:heatMap];
    
}
//删除热力图
-(void)removeHeatMap{
    [mapView removeHeatMap];
}

@end
