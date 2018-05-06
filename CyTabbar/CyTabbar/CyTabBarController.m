//
//  CyTabBarController.m
//  CardManagerOCR
//
//  Created by cy.cao on 2018/4/20.
//  Copyright © 2018年 cyroom. All rights reserved.
//

#import "CyTabBarController.h"
#import "CyNavigationControllerViewController.h"
#import "CyTabBar.h"
#import "CyViewController.h"

@interface CyTabBarController ()

@end

@implementation CyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupChildVc:[[CyViewController alloc] init] title:@"首页" image:@"tabBar_home" selectedImage:@"tabBar_home_click" isHiddenNavgationBar:NO];
    [self setupChildVc:[[CyViewController alloc] init] title:@"订单" image:@"tabBar_find" selectedImage:@"tabBar_find_click" isHiddenNavgationBar:NO];
    [self setupChildVc:[[CyViewController alloc] init] title:@"资讯" image:@"tabBar_find" selectedImage:@"tabBar_find_click" isHiddenNavgationBar:NO];
    [self setupChildVc:[[CyViewController alloc] init] title:@"我的" image:@"tabBar_me" selectedImage:@"tabBar_me_click" isHiddenNavgationBar:NO];
    
    [[UITabBar appearance] setBackgroundImage:[self imageWithColor:[UIColor whiteColor]]];
    //  设置tabbar
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    // 设置自定义的tabbar
    [self setCustomtabbar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage isHiddenNavgationBar:(BOOL)isHidden
{
    static NSInteger index = 0;
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];// 始终绘制图片原始状态，不使用Tint Color
    vc.tabBarItem.selectedImage =[[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.tag = index;
    index++;
    CyNavigationControllerViewController *nav = [[CyNavigationControllerViewController alloc] initWithRootViewController:vc];
    if(isHidden)
    {
        nav.navigationBar.hidden = YES;
    }
    [self addChildViewController:nav];
    
}

-(UIImage *)imageWithColor:(UIColor *)color
{
    //一个像素
    CGRect rect = CGRectMake(0, 0, 1, 1);
    //开启上下文
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

-(void)setCustomtabbar
{
    CyTabBar *tabbar = [[CyTabBar alloc] init];
    [self setValue:tabbar forKeyPath:@"tabBar"];
//    [self.view addSubview:tabbar];
//    [self.tabBar addSubview:tabbar];
    [tabbar.centerBtn addTarget:self action:@selector(centerBtnClick:) forControlEvents:UIControlEventTouchDown];
}

-(void)centerBtnClick:(UIButton *)btn
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"你点击了订单按钮" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}



+ (void)initialize
{
    //设置未选中的TabBarItem的字体颜色、大小
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    //设置选中了的TabBarItem的字体颜色、大小
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:153.0/255.0 green:93.0/255.0 blue:176.0/255.0 alpha:1];
    
    UITabBarItem *item = [UITabBarItem appearance];
    
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
