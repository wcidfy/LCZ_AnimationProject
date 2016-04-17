//
//  BottonCell.m
//  LCZ_AnimationProject
//
//  Created by lxx on 16/4/17.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "BottonCell.h"
@interface BottonCell()
{
    UIView *line1;
    UIView *line2;
    UIView *line3;

}
@end
@implementation BottonCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        _buttonDing=[self button];
        [_buttonDing setImage:[UIImage imageNamed:@"commentLikeButton"] forState:UIControlStateNormal];
        [_buttonDing setImage:[UIImage imageNamed:@"commentLikeButtonClick"] forState:UIControlStateHighlighted];
        [self addSubview:_buttonDing];
        
        line1=[self line];
        [self addSubview:line1];
        
        _buttonCai=[self button];
        [_buttonCai setImage:[UIImage imageNamed:@"mainCellCai"] forState:UIControlStateNormal];
        [_buttonCai setImage:[UIImage imageNamed:@"mainCellCaiClick"] forState:UIControlStateHighlighted];
        [self addSubview:_buttonCai];
        
        line2=[self line];
        [self addSubview:line2];
        _buttonForward=[self button];
        [_buttonForward setImage:[UIImage imageNamed:@"mainCellShare"] forState:UIControlStateNormal];
        [_buttonForward setImage:[UIImage imageNamed:@"mainCellShareClick"] forState:UIControlStateHighlighted];
        [self addSubview:_buttonForward];
        line3=[self line];
        [self addSubview:line3];
        
        _buttonAnswer=[self button];
        [_buttonAnswer setImage:[UIImage imageNamed:@"mainCellComment"] forState:UIControlStateNormal];
        [_buttonAnswer setImage:[UIImage imageNamed:@"mainCellCommentClick"] forState:UIControlStateHighlighted];
        [self addSubview:_buttonAnswer];
    }


    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    _buttonDing.frame=CGRectMake(0, 0, (LCZViewWidth-3)/4, 50);
    line1.frame=CGRectMake((LCZViewWidth-3)/4, 3, 1, 50-6);
     _buttonCai.frame=CGRectMake((LCZViewWidth-3)/4+1, 0, (LCZViewWidth-3)/4, 50);
    line2.frame=CGRectMake((LCZViewWidth-3)/4*2+1, 3, 1, 50-6);
     _buttonForward.frame=CGRectMake((LCZViewWidth-3)/4*2+2, 0, (LCZViewWidth-3)/4, 50);
     line3.frame=CGRectMake((LCZViewWidth-3)/4*3+2, 3, 1, 50-6);
      _buttonAnswer.frame=CGRectMake((LCZViewWidth-3)/4*3+3, 0, (LCZViewWidth-3)/4, 50);


}
-(UIButton *)button
{
    UIButton *butt=[UIButton buttonWithType:UIButtonTypeCustom];
    [butt setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    butt.backgroundColor=[UIColor whiteColor];
    return butt;
    
}
-(UIView *)line
{
    UIView *line=[[UIView alloc]init];
    
    [line setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"cell-button-line"]]];
    
    return line;



}
@end
