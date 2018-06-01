//
//  MGTabBarViewController.m
//  觅购
//
//  Created by ycicd on 2017/10/31.
//  Copyright © 2017年 migou. All rights reserved.
//

#import "MGTabBarViewController.h"
#import "MXSMyViewController.h"
#import "MXSFindViewController.h"
#import "MXSShopViewController.h"
#import "MXSMainViewController.h"
#import "Const.h"
#import "YBColorConfigure.h"
#define tabBarCount  4
@interface MGTabBarViewController ()
@property(nonatomic,strong)  MXSMainViewController*main;
@property(nonatomic,strong) MXSShopViewController *shop;
@property(nonatomic,strong) MXSFindViewController *find;
@property(nonatomic,strong) MXSMyViewController *my;


@property (nonatomic) UIButton *mainBtn;
@property (nonatomic) UIButton *shopBtn;
@property (nonatomic) UIButton *findBtn;
@property (nonatomic) UIButton *myBtn;

@property (nonatomic) UILabel *mainLabel;
@property (nonatomic) UILabel *findLabel;
@property (nonatomic) UILabel *shopLabel;
@property (nonatomic) UILabel *myLabel;

@end

@implementation MGTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpAllChildViewController];
}

/**
 *  添加所有子控制器
 */
- (void)setUpAllChildViewController{
    //如果不禁止功能的话，该控制器以及子控制器的滚动视图内容会向下偏移20
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    if (tabBarCount==4) {
        self.main = [[MXSMainViewController alloc]init];
        self.find = [[MXSFindViewController alloc]init];
        self.shop = [[MXSShopViewController alloc]init];
        self.my = [[MXSMyViewController alloc]init];
        self.viewControllers=@[self.main,self.shop,self.find,self.my];
    }else{
        self.main = [[MXSMainViewController alloc]init];
        self.find = [[MXSFindViewController alloc]init];
        self.shop = [[MXSShopViewController alloc]init];
        self.my = [[MXSMyViewController alloc]init];
        self.viewControllers=@[self.main,self.shop,self.find,self.my];
    }
    
    self.selectedViewController = [self.viewControllers objectAtIndex:0];//默认选择第一个
    
    self.tabBar.translucent = NO;
    
    self.mainBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, -5, DeviceWidth/tabBarCount, 49)];
    self.mainBtn.enabled = NO;
    [self.mainBtn setImage:[UIImage imageNamed:@"首页未选中"] forState:UIControlStateNormal];
    [self.mainBtn setImage:[UIImage imageNamed:@"首页未选中"] forState:UIControlStateHighlighted];
    [self.mainBtn setImage:[UIImage imageNamed:@"首页选中"] forState:UIControlStateDisabled];
    [self.mainBtn addTarget:self action:@selector(clickMain:) forControlEvents:UIControlEventTouchUpInside];
    [self.tabBar addSubview:self.mainBtn];
    
    self.mainLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 37, DeviceWidth/tabBarCount, 8)];
    self.mainLabel.font = [UIFont systemFontOfSize:10*fontSizeScale];
    self.mainLabel.textAlignment = NSTextAlignmentCenter;
    self.mainLabel.text = @"首页";
    self.mainLabel.textColor = MgTagColor;
    
    [self.tabBar addSubview:self.mainLabel];
    
    self.shopBtn = [[UIButton alloc]initWithFrame:CGRectMake(DeviceWidth/tabBarCount, -5, DeviceWidth/tabBarCount, 49)];
    [self.shopBtn setImage:[UIImage imageNamed:@"觅店未选"] forState:UIControlStateNormal];
    [self.shopBtn setImage:[UIImage imageNamed:@"觅店未选"] forState:UIControlStateHighlighted];
    [self.shopBtn setImage:[UIImage imageNamed:@"觅店选中"] forState:UIControlStateDisabled];
    self.shopBtn.showsTouchWhenHighlighted = NO;
    [self.shopBtn addTarget:self action:@selector(clickShop:) forControlEvents:UIControlEventTouchUpInside];
    [self.tabBar addSubview:self.shopBtn];
    
    self.shopLabel = [[UILabel alloc]initWithFrame:CGRectMake(DeviceWidth/tabBarCount, 37, DeviceWidth/tabBarCount, 8)];
    self.shopLabel.font = [UIFont systemFontOfSize:10*fontSizeScale];
    self.shopLabel.textAlignment = NSTextAlignmentCenter;
    self.shopLabel.text = @"觅店";
    self.shopLabel.textColor = tobuydetailColor;
    [self.tabBar addSubview:self.shopLabel];
    
    
    self.findBtn = [[UIButton alloc]initWithFrame:CGRectMake((DeviceWidth/tabBarCount)*2, -5, DeviceWidth/tabBarCount, 49)];
    [self.findBtn setImage:[UIImage imageNamed:@"发现未选"] forState:UIControlStateNormal];
    [self.findBtn setImage:[UIImage imageNamed:@"发现未选"] forState:UIControlStateHighlighted];
    [self.findBtn setImage:[UIImage imageNamed:@"发现选中"] forState:UIControlStateDisabled];
    self.findBtn.showsTouchWhenHighlighted = NO;
    [self.findBtn addTarget:self action:@selector(clickFind:) forControlEvents:UIControlEventTouchUpInside];
    [self.tabBar addSubview:self.findBtn];
    
    self.findLabel = [[UILabel alloc]initWithFrame:CGRectMake((DeviceWidth/tabBarCount)*2, 37, DeviceWidth/tabBarCount, 8)];
    self.findLabel.font = [UIFont systemFontOfSize:10*fontSizeScale];
    self.findLabel.textAlignment = NSTextAlignmentCenter;
    self.findLabel.text = @"发现";
    self.findLabel.textColor = tobuydetailColor;
    [self.tabBar addSubview:self.findLabel];
    
    self.myBtn = [[UIButton alloc]initWithFrame:CGRectMake((DeviceWidth/tabBarCount)*3, -5, DeviceWidth/tabBarCount, 49)];
    [self.myBtn setImage:[UIImage imageNamed:@"我的未选"] forState:UIControlStateNormal];
    [self.myBtn setImage:[UIImage imageNamed:@"我的未选"] forState:UIControlStateHighlighted];
    [self.myBtn setImage:[UIImage imageNamed:@"我的选中"] forState:UIControlStateDisabled];
    [self.myBtn addTarget:self action:@selector(clickMy:) forControlEvents:UIControlEventTouchUpInside];
    [self.tabBar addSubview:self.myBtn];
    
    self.myLabel = [[UILabel alloc]initWithFrame:CGRectMake((DeviceWidth/tabBarCount)*3, 37, DeviceWidth/tabBarCount, 8)];
    self.myLabel.font = [UIFont systemFontOfSize:10*fontSizeScale];
    self.myLabel.textAlignment = NSTextAlignmentCenter;
    self.myLabel.text = @"我的";
    self.myLabel.textColor = tobuydetailColor;
    [self.tabBar addSubview:self.myLabel];
    
}

/**
 首页
 */
-(void)clickMain:(UIButton *)btn{
    btn.enabled = NO;
    self.selectedViewController = self.main;
    
    self.findBtn.enabled = YES;
    self.shopBtn.enabled = YES;
//    self.circleBtn.enabled = YES;
    self.myBtn.enabled = YES;
    
    self.mainLabel.textColor = MgTagColor;
    self.shopLabel.textColor = tobuydetailColor;
    self.findLabel.textColor = tobuydetailColor;
//    self.circleLabel.textColor = tobuydetailColor;
    self.myLabel.textColor = tobuydetailColor;
}

/**
 觅店
 */
-(void)clickShop:(UIButton *)btn{
    btn.enabled = NO;
    self.selectedViewController = self.shop;
    
    self.findBtn.enabled = YES;
    self.mainBtn.enabled = YES;
//    self.circleBtn.enabled = YES;
    self.myBtn.enabled = YES;
    
    self.shopLabel.textColor = MgTagColor;
    self.mainLabel.textColor = tobuydetailColor;
    self.findLabel.textColor = tobuydetailColor;
//    self.circleLabel.textColor = tobuydetailColor;
    self.myLabel.textColor = tobuydetailColor;
    
}

/**
 发现
 */
-(void)clickFind:(UIButton *)btn{
    btn.enabled = NO;
    self.selectedViewController = self.find;
    
//    self.circleBtn.enabled = YES;
    self.mainBtn.enabled = YES;
    self.shopBtn.enabled = YES;
    self.myBtn.enabled = YES;
    
    self.findLabel.textColor = MgTagColor;
    self.mainLabel.textColor = tobuydetailColor;
//    self.circleLabel.textColor = tobuydetailColor;
    self.shopLabel.textColor = tobuydetailColor;
    self.myLabel.textColor = tobuydetailColor;
}

/**
 我的
 */
-(void)clickMy:(UIButton *)btn{
    btn.enabled = NO;
    self.selectedViewController = self.my;
    
    self.findBtn.enabled = YES;
    self.mainBtn.enabled = YES;
    self.shopBtn.enabled = YES;
//    self.circleBtn.enabled = YES;
    
    self.myLabel.textColor = MgTagColor;
    self.mainLabel.textColor = tobuydetailColor;
    self.findLabel.textColor = tobuydetailColor;
    self.shopLabel.textColor = tobuydetailColor;
//    self.circleLabel.textColor = tobuydetailColor;
}





@end

