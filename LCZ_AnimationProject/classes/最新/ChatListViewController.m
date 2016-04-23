//
//  ChatListViewController.m
//  LCZ_AnimationProject
//
//  Created by lxx on 16/4/23.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "ChatListViewController.h"
#import "KxMenu.h"
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
    
}

//重写RCConversationListViewController的onSelectedTableRow事件
- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType
         conversationModel:(RCConversationModel *)model
               atIndexPath:(NSIndexPath *)indexPath {
    RCConversationViewController *conversationVC = [[RCConversationViewController alloc]init];
    conversationVC.conversationType = model.conversationType;
    conversationVC.targetId = model.targetId;
        conversationVC.title=model.targetId;
    self.hidesBottomBarWhenPushed=YES;
    
    [self.navigationController pushViewController:conversationVC animated:YES];
//    [self presentViewController:conversationVC animated:YES completion:nil];
}
-(void)showMenu:(UIButton *)sender {
    NSArray *menuItems =
    @[
      
      [KxMenuItem menuItem:@"发起聊天"
                     image:[UIImage imageNamed:@"chat_icon"]
                    target:self
                    action:@selector(pushChat:)],
      
      [KxMenuItem menuItem:@"添加好友"
                     image:[UIImage imageNamed:@"addfriend_icon"]
                    target:self
                    action:@selector(pushAddFriend:)],
      
      [KxMenuItem menuItem:@"通讯录"
                     image:[UIImage imageNamed:@"contact_icon"]
                    target:self
                    action:@selector(pushAddressBook:)],
      
      [KxMenuItem menuItem:@"公众账号"
                     image:[UIImage imageNamed:@"public_account"]
                    target:self
                    action:@selector(pushPublicService:)],
      
      [KxMenuItem menuItem:@"添加公众号"
                     image:[UIImage imageNamed:@"add_public_account"]
                    target:self
                    action:@selector(pushAddPublicService:)],
      ];
    
    CGRect targetFrame = self.tabBarController.navigationItem.rightBarButtonItem.customView.frame;
    targetFrame.origin.y = targetFrame.origin.y + 46;
     targetFrame.origin.x = self.view.size.width-100;
    targetFrame.size.width=100;
    [KxMenu showMenuInView:self.view
                  fromRect:targetFrame
                 menuItems:menuItems];
//    KxMenuItem *first = menuItems[0];
//    first.foreColor = [UIColor colorWithRed:47/255.0f green:112/255.0f blue:225/255.0f alpha:1.0];
//    first.alignment = NSTextAlignmentCenter;
    
//    [KxMenu showMenuInView:self.view
//                  fromRect:CGRectMake(self.view.bounds.size.width-100, -46, 100, 100)
//                 menuItems:menuItems];
}
//- (void)showMenu:(UIButton *)sender
//{
//    NSLog(@"13213");
//    NSArray *menuItems =
//    @[
//      
//      [KxMenuItem menuItem:@"ACTION MENU Test"
//                     image:nil
//                    target:nil
//                    action:NULL],
//      
//      [KxMenuItem menuItem:@"Share this"
//                     image:nil
//                    target:self
//                    action:@selector(pushChat:)],
//      
//      [KxMenuItem menuItem:@"Check menu"
//                     image:nil
//                    target:self
//                    action:@selector(pushMenuItem:)],
//      
//      [KxMenuItem menuItem:@"Reload page"
//                     image:nil
//                    target:self
//                    action:@selector(pushMenuItem:)],
//      
//      [KxMenuItem menuItem:@"Search"
//                     image:nil
//                    target:self
//                    action:@selector(pushMenuItem:)],
//      
//      [KxMenuItem menuItem:@"Go home"
//                     image:nil
//                    target:self
//                    action:@selector(pushMenuItem:)],
//      ];
//    
//    KxMenuItem *first = menuItems[0];
//    first.foreColor = [UIColor colorWithRed:47/255.0f green:112/255.0f blue:225/255.0f alpha:1.0];
//    first.alignment = NSTextAlignmentCenter;
//    
//    [KxMenu showMenuInView:self.view
//                  fromRect:CGRectMake(self.view.bounds.size.width-100, -46, 100, 100)
//                 menuItems:menuItems];
//}
- (void) pushChat:(id)sender
{

    NSLog(@"23432'");

}
@end
