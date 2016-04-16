//
//  VideoViewController.m
//  LCZ_AnimationProject
//
//  Created by lxx on 16/4/12.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "VideoViewController.h"
#import "MJRefresh.h"
#import "recomTool.h"
#import "TopViewCell.h"
#import "TopModel.h"
static NSString *cellID=@"cellid";
@interface VideoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *topFrame;
@property(nonatomic,strong)UITableView *tableview;

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    _tableview=[[UITableView alloc]init];
    _tableview.frame=CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-64-50);
    _tableview.delegate=self;
    _tableview.dataSource=self;
    [self.view addSubview:_tableview];
    [self setRefre];
    
}
#pragma mark 添加刷新
-(void)setRefre
{
    self.tableview.mj_header =[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewDate)];
    [self.tableview.mj_header beginRefreshing];
    


}
-(void)loadNewDate
{

    [recomTool getDataWithArrayType:TopicTypeVideo parameterA:@"newlist" block:^(id json, id param) {
        
        NSLog(@"qwewq");
        for (TopModel *topic in json) {
            TopFrame *topFrome=[[TopFrame alloc]init];
            topFrome.topic=topic;
            [self.topFrame addObject:topFrome];
        }
        [self.tableview reloadData];
        [self.tableview.mj_header endRefreshing];
    }];


}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.topFrame.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    TopViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) {
        cell=[[TopViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.topFrame=self.topFrame[indexPath.row];
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TopFrame *topframe=self.topFrame[indexPath.row];
    return topframe.cellHeight;

}

@end
