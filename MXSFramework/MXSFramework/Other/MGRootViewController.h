//
//  MGRootViewController.h
//  觅购
//
//  Created by ycicd on 2017/10/31.
//  Copyright © 2017年 migou. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "NetworkTool.h"
//#import "MGLoginManager.h"
//#import <MJRefresh.h>
typedef void(^btnBlock)(UIButton *btn);

@interface MGRootViewController : UIViewController{
    NSMutableArray *idleImages;
}
@property (nonatomic,strong) UIView * topView;
@property (nonatomic, strong) UIButton * leftButton;
@property (nonatomic, strong) UIButton * rightButton;
@property (nonatomic, strong) UILabel * titlelabel;
@property (nonatomic, strong) UIView * bottomLine;

@property (nonatomic, copy) NSString * localLongitude;
@property (nonatomic, copy) NSString * localLatitude;

@property (strong, nonatomic) UIView *noDataView;//没数据时加载的view

//我是有底线的 tableview的footview
-(UIView *)AddtableViewFootView;

//无数据加载的view
-(void)onlyImageNodataViewWithImage:(NSString *)ImageName;//3秒自动消失
-(void)onlyImageActivityViewWithImage:(NSString *)ImageName;//点击消失

-(void)nodataViewWithText:(NSString *)text imageName:(NSString *)imageName;
-(UIView *)onlyTextNodataViewWithText:(NSString *)text;
-(UIView *)onlyTextNodataViewWithText:(NSString *)text ishidden:(BOOL)ishidden;
-(void)onlyTextNodataViewWithText:(NSString *)text ishidden:(BOOL)ishidden superClass:(UIView *)view;
//配置导航栏的方法
-(void)configureBarWithTtitle:(NSString *)title;
-(void)configureBarWithTtitle:(NSString *)title image:(UIImage *)image;
-(void)configureBarWithTtitle:(NSString *)title rightBtnTilte:(NSString *)rightBtnTiltle  andClick:(btnBlock)btnblock;
-(void)backClick:(UIButton*)sender;
-(void)configureBarWithTtitle:(NSString *)title rightBtnimageName:(NSString *)imageName andClick:(btnBlock)btnblock;
-(void)configureBarHaveBackWithTtitle:(NSString *)title rightBtnimageName:(NSString *)imageName andClick:(btnBlock)btnblock;

//中间图片 右边图片
-(void)configureBarWithimageName:(NSString *)titleImageName rightBtnimageName:(NSString *)imageName andClick:(btnBlock)btnblock;
/**
 计算大小长度

 @param text text
 @param font font
 @param maxSize maxsize
 @return size
 */
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize;
-(CGFloat)getSpaceLabelHeightwithText:(NSString *)text Speace:(CGFloat)lineSpeace withFont:(UIFont*)font withWidth:(CGFloat)width;

//统计浏览量
-(void)appbrowseUpWithId:(int)ID type:(int)type;

/**
 处理图片拉伸问题
 
 @param image 要拉伸的图片
 @param top 顶端盖高度
 @param bottom 底端盖高度
 @param left 左端盖宽度
 @param right 右端盖宽度
 @return 拉伸后的图片
 */
-(UIImage *)photoResizableImageWithCapInsetsWithimage:(UIImage *)image Top:(CGFloat)top bottom:(CGFloat)bottom left:(CGFloat)left right:(CGFloat)right;


/**
 颜色转图片
 */
- (UIImage *)imageWithColor:(UIColor *)color;
@end
