//
//  TalkViewController.m
//  LCZ_AnimationProject
//
//  Created by lxx on 16/4/12.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "TalkViewController.h"
#import "MJRefresh.h"
#import "recomTool.h"
#import "TopViewCell.h"
#import "TopModel.h"
@interface TalkViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *topicFrames;
@property(nonatomic,strong)UITableView *tableview;
@end

@implementation TalkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    self.view.backgroundColor=[UIColor whiteColor];
    _tableview=[[UITableView alloc]init];
    _tableview.frame=CGRectMake(0, 99, self.view.bounds.size.width, self.view.bounds.size.height-50-99);
    _tableview.delegate=self;
    _tableview.dataSource=self;
    //    [_tableview setHeight:40];
    [self.view bringSubviewToFront:_tableview];
    [self.view addSubview:_tableview];
    [self setRefre];
    
}
#pragma mark 添加刷新
-(void)setRefre
{
    self.tableview.mj_header =[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewDate)];
    [self.tableview.mj_header beginRefreshing];
    [self.tableview setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    
    
}
-(void)loadNewDate
{
    
    [recomTool getDataWithArrayType:TopicTypeTalk parameterA:@"newlist" block:^(id json, id param) {
        
        NSLog(@"qwewq");
        for (TopModel *topic in json) {
            TopFrame *topFrome=[[TopFrame alloc]init];
            topFrome.topic=topic;
            [self.topicFrames addObject:topFrome];
            NSLog(@"%@",topFrome.topic);
        }
        //        NSLog(@"%@",);
        [self.tableview reloadData];
        [self.tableview.mj_header endRefreshing];
    }];
    
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.topicFrames.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdTalk=@"cellIdTalk";
    TopViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdTalk];
    if (cell==nil) {
        cell=[[TopViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdTalk];
    }
    cell.topFrame=self.topicFrames[indexPath.row];
    //    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    //    if (cell==nil) {
    //        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    //    }
    //    cell.textLabel.text=@"12";
    //    cell.backgroundColor=[UIColor redColor];
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TopFrame *topframe=self.topicFrames[indexPath.row];
    
    return topframe.cellHeight;
    
    
}
- (NSMutableArray *)topicFrames{
    if (_topicFrames == nil) {
        _topicFrames = [NSMutableArray array];
        
    }
    return _topicFrames;
}
@end