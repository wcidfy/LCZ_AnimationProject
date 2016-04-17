//
//  BottonCell.h
//  LCZ_AnimationProject
//
//  Created by lxx on 16/4/17.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  cell底部转发顶贴
 */
@interface BottonCell : UIView


//     ＊ 顶帖
@property(nonatomic,strong)UIButton *buttonDing;
//     ＊ 踩帖
@property(nonatomic,strong)UIButton *buttonCai;
//     ＊ 转发
@property(nonatomic,strong)UIButton *buttonForward;
//     ＊ 转发
@property(nonatomic,strong)UIButton *buttonAnswer;
@end
