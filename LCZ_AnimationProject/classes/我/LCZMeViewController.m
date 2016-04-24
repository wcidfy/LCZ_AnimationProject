//
//  LCZMeViewController.m
//  LCZ_AnimationProject
//
//  Created by lxx on 16/4/4.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "LCZMeViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapSearchKit/AMapSearchKit.h>
#import "AddtreaViewController.h"
@interface LCZMeViewController ()<MAMapViewDelegate,CLLocationManagerDelegate>
{
    MAMapView *_mapView;
  
    CLLocationManager *cll;
}
@end

@implementation LCZMeViewController

-(void) viewDidLoad
{
    [super viewDidLoad];
   
    // Do any additional setup after loading the view, typically from a nib.

//        配置用户Key
        [MAMapServices sharedServices].apiKey = @"05f7aa645efaaa9b79af7d35410927d7";
    
        _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
        _mapView.delegate = self;
    
        _mapView.showsUserLocation = YES; //YES 为打开定位，NO为关闭定位
    
    
    MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
    pointAnnotation.coordinate = CLLocationCoordinate2DMake(40.055535, 116.430575);
    pointAnnotation.title = @"标题";
    pointAnnotation.subtitle = @"副标题";
    [_mapView addAnnotation:pointAnnotation];
    
    
        [self.view addSubview:_mapView];
     [self.navigationController setNavigationBarHidden:YES animated:YES];
     [self setNav];
    
    
  
}
-(void)setNav
{
    UIView *view=[[UIView alloc]init];
    view.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64);
    view.backgroundColor=[UIColor grayColor];
    [self.view addSubview:view];
    
    UIButton *but=[UIButton buttonWithType:UIButtonTypeCustom];
    but.frame=CGRectMake([UIScreen mainScreen].bounds.size.width-60, 0, 60, 64);
    but.titleLabel.textAlignment=NSTextAlignmentCenter;
    [but setTitle:@"Next" forState:UIControlStateNormal];
    [but setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [but addTarget:self action:@selector(ButClick) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:but];

}
-(void)ButClick
{
    AddtreaViewController *addTrea=[[AddtreaViewController alloc]init];
    [self.navigationController pushViewController:addTrea animated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation
updatingLocation:(BOOL)updatingLocation
{
    if(updatingLocation)
    {
        //取出当前位置的坐标
        NSLog(@"latitude : %f,longitude: %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
        
    }
}
@end
