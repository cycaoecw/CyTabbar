//
//  CyTabBar.m
//  CardManagerOCR
//
//  Created by cy.cao on 2018/4/22.
//  Copyright © 2018年 cyroom. All rights reserved.
//

#import "CyTabBar.h"

static const NSInteger ITEMCOUNT = 5;
@interface CyTabBar()
@property (nonatomic, strong) UIButton *orderButton;
@property (nonatomic, assign) NSInteger selectedIndex;
@end

@implementation CyTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)init
{
    self = [super init];
    if(self)
    {
        UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, -1, [UIScreen mainScreen].bounds.size.width, 1)];
        topView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:topView];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
        button.bounds = CGRectMake(0, 0, 64, 64);
        self.centerBtn = button;
        [self addSubview:button];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.centerBtn.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 10);
    
    int index = 0;
    CGFloat width_item = self.frame.size.width / ITEMCOUNT;
    for (UIView *sub in self.subviews)
    {
        if([sub isKindOfClass:NSClassFromString(@"UITabBarButton")])
        {
            CGRect frame = sub.frame;
            frame.origin.x = index * width_item;
            sub.frame = frame;
            index++;
            int mid_index = ITEMCOUNT / 2;
            if(index == mid_index)
//            if(index == 2)
            {
                index ++;
            }
        }
    }
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if(self.isHidden == NO)
    {
        CGPoint newPoint = [self convertPoint:point toView:self.centerBtn];
        
        if([self.centerBtn pointInside:newPoint withEvent:event])
        {
            return self.centerBtn;
        }
        else
        {
            return [super hitTest:point withEvent:event];
        }
    }
    else
    {
        return [super hitTest:point withEvent:event];
    }
}
@end
