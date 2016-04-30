//
//  ChatListViewController.m
//  LCZ_AnimationProject
//
//  Created by lxx on 16/4/23.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "ChatListViewController.h"
#import "KxMenu.h"
#import "ChatViewController.h"
@interface ChatListViewController ()

@end

@implementation ChatListViewController

- (void)viewDidLoad {
    //重写显示相关的接口，必须先调用super，否则会屏蔽SDK默认的处理
    [super viewDidLoad];
    
    //设置需要显示哪些类型的会话
    [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE),
                                        @(ConversationType_DISCUSSION),
                                        @(ConversationType_CHATROOM),
                                        @(ConversationType_GROUP),
                                        @(ConversationType_APPSERVICE),
                                        @(ConversationType_SYSTEM)]];
    //设置需要将哪些类型的会话在会话列表中聚合显示
    [self setCollectionConversationType:@[@(ConversationType_DISCUSSION),
                                          @(ConversationType_GROUP)]];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"+" style:UIBarButtonItemStyleDone target:self action:@selector(showMenu:)];
    [self setConversationAvatarStyle:1];
   
}

//重写RCConversationListViewController的onSelectedTableRow事件
- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType
         conversationModel:(RCConversationModel *)model
               atIndexPath:(NSIndexPath *)indexPath {
    ChatViewController *conversationVC = [[ChatViewController alloc]init];
//    私聊
    conversationVC.conversationType =1;
    conversationVC.targetId = model.senderUserId;
     RCUserInfo *aUserInfo = [[RCUserInfo alloc]initWithUserId:@"111" name:@"xxxx" portrait:@"http://img2.imgtn.bdimg.com/it/u=998138008,4043877710&fm=206&gp=0.jpg"];;
        conversationVC.title=aUserInfo.name;
    
    self.hidesBottomBarWhenPushed=YES;
    
    [self.navigationController pushViewController:conversationVC animated:YES];
}
-(void)showMenu:(UIButton *)sender {
    NSArray *menuItems =
    @[
      
      [KxMenuItem menuItem:@"发起聊天"
                     image:[UIImage imageNamed:@"chat_icon"]
                    target:self
                    action:@selector(pushChat)],
      
      [KxMenuItem menuItem:@"添加好友"
                     image:[UIImage imageNamed:@"addfriend_icon"]
                    target:self
                    action:@selector(pushAddFriend)],
      
      [KxMenuItem menuItem:@"通讯录"
                     image:[UIImage imageNamed:@"contact_icon"]
                    target:self
                    action:@selector(pushAddressBook)],
      
      [KxMenuItem menuItem:@"公众账号"
                     image:[UIImage imageNamed:@"public_account"]
                    target:self
                    action:@selector(pushPublicService)],
      
      [KxMenuItem menuItem:@"添加公众号"
                     image:[UIImage imageNamed:@"add_public_account"]
                    target:self
                    action:@selector(pushAddPublicService)],
      ];
    
    CGRect targetFrame = self.tabBarController.navigationItem.rightBarButtonItem.customView.frame;
    targetFrame.origin.y = targetFrame.origin.y + 64;
     targetFrame.origin.x = self.view.size.width-100;
    targetFrame.size.width=100;
    [KxMenu showMenuInView:self.view
                  fromRect:targetFrame
                 menuItems:menuItems];
    [KxMenu setTintColor: [UIColor clearColor]];

    

}
#pragma mark 发起聊天
- (void) pushChat
{

    NSLog(@"发起聊天");

}
#pragma mark 添加好友
-(void)pushAddFriend
{
     NSLog(@"添加好友");
}
#pragma mark 通讯录
-(void)pushAddressBook
{
     NSLog(@"通讯录");
}
#pragma mark 公众账号
-(void)pushPublicService
{
     NSLog(@"公众账号");
}
#pragma mark 添加公众账号
-(void)pushAddPublicService
{
     NSLog(@"添加公众账号");
}
@end
