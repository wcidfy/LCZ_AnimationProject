//
//  LCZEssenceViewController.m
//  LCZ_AnimationProject
//
//  Created by lxx on 16/4/4.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "LCZEssenceViewController.h"
#import "RecommendViewController.h"
#import "TalkViewController.h"
#import "PicViewController.h"
#import "VideoViewController.h"
#import "VoiceViewController.h"

@interface LCZEssenceViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong) UIView *titleView;
@property (nonatomic,  weak) UIButton *seletedBtn;

@end

@implementation LCZEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;

    // Do any additional setup after loading the view.
    [self setControllers];
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.titleView];
    [self setupTitleBtn];
    

    
}

-(void)setControllers
{
    RecommendViewController *recomme=[[RecommendViewController alloc]init];
    [self addChildViewController:recomme];
    
    VideoViewController *video=[[VideoViewController alloc]init];
    [self addChildViewController:video];
    
    PicViewController *pic=[[PicViewController alloc]init];
    [self addChildViewController:pic];
    
    VoiceViewController *voice=[[VoiceViewController alloc]init];
    [self addChildViewController:voice];
    
    TalkViewController *talk=[[TalkViewController alloc]init];
    [self addChildViewController:talk];


}
//设置titleView按钮
-(void)setupTitleBtn {
    NSArray *titles = @[@"推荐",@"视频",@"图片",@"声音",@"段子"];
    NSInteger count = titles.count;
    CGFloat btnH = self.titleView.height - 2;
    CGFloat btnW = self.titleView.width / count;
    CGFloat btnY = 0;
    for (NSInteger i = 0; i<count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        CGFloat btnX = btnW * i;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        [self.titleView addSubview:btn];
        //默认选中第一个按钮
        if (btn.tag == 0) {
            btn.enabled = NO;
            self.seletedBtn = btn;
            [btn.titleLabel sizeToFit];
            
//            self.btnIndicator.width = btn.titleLabel.width;
//            self.btnIndicator.centerX = btn.centerX;
        }
    }
}
//按钮点击事件
-(void)btnClick:(UIButton *)btn {
    //按钮状态
    self.seletedBtn.enabled = YES;
    btn.enabled = NO;
    self.seletedBtn = btn;
    //指示器动画
    [UIView animateWithDuration:0.2 animations:^{
        //必须在这里才设置指示器的宽度，要不宽度会计算错误
//        self.btnIndicator.width = btn.titleLabel.width;
//        self.btnIndicator.centerX = btn.centerX;
    }];
    //控制器view的滚动
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = btn.tag * self.scrollView.width;
    [self.scrollView setContentOffset:offset animated:YES];
    
    
}

-(UIScrollView *)scrollView
{
    if (_scrollView==nil) {
        _scrollView=[[UIScrollView alloc]init];
        _scrollView.frame=self.view.bounds;
        _scrollView.delegate=self;
        _scrollView.pagingEnabled=YES;
        _scrollView.contentSize=CGSizeMake(_scrollView.width*self.childViewControllers.count, 0);
        [self scrollViewDidEndScrollingAnimation:self.scrollView];
    }
    return _scrollView ;
}
- (UIView *)titleView{
    if (_titleView == nil) {
        _titleView = [[UIView alloc]init];
        _titleView.frame = CGRectMake(0, 64, self.view.width, 35);
        _titleView.backgroundColor = [[UIColor whiteColor]colorWithAlphaComponent:0.7];
    }
    return _titleView;
}

#pragma mark  滚动视图代理
/**
 *  <#Description#>
 *
 *  @param scrollView 结束滚动动画
 */
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {

{
    CGPoint pt=scrollView.contentOffset;
    NSInteger index=pt.x/scrollView.width;
    UITabBarController *tableVc=self.childViewControllers[index];
    tableVc.view.x=scrollView.contentOffset.x;
    tableVc.view.y=0;
    tableVc.view.height=scrollView.height;
    [scrollView addSubview:tableVc.view];
    

}
}
@end
