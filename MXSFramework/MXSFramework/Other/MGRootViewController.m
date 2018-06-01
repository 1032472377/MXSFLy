//
//  MGRootViewController.m
//  觅购
//
//  Created by ycicd on 2019*Device_Ccale/10/31.
//  Copyright © 2019*Device_Ccale年 migou. All rights reserved.
//

#import "MGRootViewController.h"
#import "Const.h"
//#import "masonry.h"
#import <CoreLocation/CoreLocation.h>
#define YBNavBar 44

@interface MGRootViewController ()<UIAlertViewDelegate>
@property (copy, nonatomic) btnBlock block;
@property (strong, nonatomic) UILabel *nodataLabel;
@property (strong, nonatomic) UIImageView *noDataImage;


@end

@implementation MGRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //定位
//    [self createBaiDuMapView];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (IS_IOS7) {
        if (kCLAuthorizationStatusDenied == status || kCLAuthorizationStatusRestricted == status) {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"定位服务未开启" message:@"定位服务已被关闭，请前往设置页面打开" delegate:self cancelButtonTitle:@"暂不" otherButtonTitles:@"去设置", nil];
            [alertView show];
        }
    }else if (IS_IOS8){
        if (kCLAuthorizationStatusDenied == status || kCLAuthorizationStatusRestricted == status) {
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"定位服务未开启" message:@"定位服务已被关闭，请前往设置页面打开" delegate:self cancelButtonTitle:@"暂不" otherButtonTitles:@"去设置", nil];
            [alertView show];
        }
    }
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(otherDeviceUp) name:Notification_otherDeviceUpNotification object:nil];
    });
}

/**
 账号在别的手机登录
 */
-(void)otherDeviceUp{
    UIAlertView *al = [[UIAlertView alloc]initWithTitle:@"提示" message:@"检测到您的账号在其他设备登录" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"重新登录", nil];
    al.tag = 88888;
    [al show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 88888) {
        //清除缓存数据
//        [CacheUserLogin deleteCacheCurrentUserFromUserDefault];
        if (buttonIndex == 1) {
          
        }
    }else{
        if (buttonIndex == 1) {
            NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            if( [[UIApplication sharedApplication]canOpenURL:url] ) {
                [[UIApplication sharedApplication] openURL:url];
            }
        }
    }
    
}
//常规导航加图片 无返回按钮
-(void)configureBarWithTtitle:(NSString *)title rightBtnimageName:(NSString *)imageName andClick:(btnBlock)btnblock{
    self.topView = [[UIView alloc]init];
    self.topView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, Height_NavBar);
    self.topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.topView];
    
    
    
    UILabel * titleLabel = [[UILabel alloc]init];
    titleLabel.frame = CGRectMake(0, Height_StatusBar, 200, YBNavBar);
    titleLabel.text = title;
    titleLabel.center = CGPointMake(self.topView.center.x, titleLabel.center.y);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:19*Device_Ccale];
    titleLabel.textColor = YBTextDarkColor;
    titleLabel.backgroundColor = [UIColor clearColor];
    [self.topView addSubview:titleLabel];
    
    UIButton * backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(DeviceWidth-44-8, Height_StatusBar, YBNavBar, YBNavBar);
    [backButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
    //    [backButton addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:backButton];
    self.rightButton = backButton;
    self.block = btnblock;
    
    UILabel * sepLabel = [[UILabel alloc]init];
    CGFloat height = Height_NavBar;
    sepLabel.frame = CGRectMake(0, height-1, [UIScreen mainScreen].bounds.size.width, 1);
    sepLabel.backgroundColor = YBSectionLineColor;
    [self.topView addSubview:sepLabel];
}
//常规导航加图片 有返回按钮
-(void)configureBarHaveBackWithTtitle:(NSString *)title rightBtnimageName:(NSString *)imageName andClick:(btnBlock)btnblock{
    self.topView = [[UIView alloc]init];
    self.topView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, Height_NavBar);
    self.topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.topView];
    
    self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftButton.frame = CGRectMake(0, Height_StatusBar, YBNavBar, YBNavBar);
    [self.leftButton setImage:[UIImage imageNamed:@"BACK"] forState:UIControlStateNormal];
    [self.leftButton addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:self.leftButton];
    
    UILabel * titleLabel = [[UILabel alloc]init];
    titleLabel.frame = CGRectMake(0, Height_StatusBar, 200, YBNavBar);
    titleLabel.text = title;
    titleLabel.center = CGPointMake(self.topView.center.x, titleLabel.center.y);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:19*Device_Ccale];
    titleLabel.textColor = YBTextDarkColor;
    titleLabel.backgroundColor = [UIColor clearColor];
    [self.topView addSubview:titleLabel];
    
    UIButton * backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(DeviceWidth-44-8, Height_StatusBar, YBNavBar, YBNavBar);
    [backButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
    //    [backButton addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:backButton];
    self.rightButton = backButton;
    self.block = btnblock;
    
    UILabel * sepLabel = [[UILabel alloc]init];
    CGFloat height = Height_NavBar;
    sepLabel.frame = CGRectMake(0, height-1, [UIScreen mainScreen].bounds.size.width, 1);
    sepLabel.backgroundColor = YBSectionLineColor;
    [self.topView addSubview:sepLabel];
}
//中间图片 右边图片
-(void)configureBarWithimageName:(NSString *)titleImageName rightBtnimageName:(NSString *)imageName andClick:(btnBlock)btnblock{
    self.topView = [[UIView alloc]init];
    self.topView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, Height_NavBar);
    self.topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.topView];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:titleImageName];
    imageView.center = CGPointMake(self.topView.center.x, self.topView.center.y);
    [imageView sizeToFit];
    [self.topView addSubview:imageView];
    
    UIButton * backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(DeviceWidth-44-8, Height_StatusBar, YBNavBar, YBNavBar);
    [backButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
    //    [backButton addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:backButton];
    self.rightButton = backButton;
    self.block = btnblock;
    
    UILabel * sepLabel = [[UILabel alloc]init];
    CGFloat height = Height_NavBar;
    sepLabel.frame = CGRectMake(0, height-1, [UIScreen mainScreen].bounds.size.width, 1);
    sepLabel.backgroundColor = YBSectionLineColor;
    [self.topView addSubview:sepLabel];
}



//常规导航加图片
-(void)configureBarWithTtitle:(NSString *)title image:(UIImage *)image{
    self.topView = [[UIView alloc]init];
    self.topView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, Height_NavBar);
    self.topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.topView];
    
    UIButton * backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, Height_StatusBar, YBNavBar, YBNavBar);
    [backButton setImage:[UIImage imageNamed:@"BACK"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:backButton];
    
    
    UILabel * titleLabel = [[UILabel alloc]init];
    titleLabel.frame = CGRectMake(backButton.frame.origin.x+backButton.frame.size.width, Height_StatusBar, self.topView.frame.size.width-backButton.frame.origin.x-backButton.frame.size.width, YBNavBar);
    titleLabel.text = title;
    titleLabel.center = CGPointMake(self.topView.center.x+20, titleLabel.center.y);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:19*Device_Ccale];
    titleLabel.textColor = YBTextDarkColor;
    titleLabel.backgroundColor = [UIColor clearColor];
    [self.topView addSubview:titleLabel];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame = CGRectMake(backButton.frame.origin.x, Height_StatusBar, 20, 20);
    imageView.image = image;
    imageView.center = CGPointMake(self.topView.center.x-35, titleLabel.center.y);
    [self.topView addSubview:imageView];
    
    UILabel * sepLabel = [[UILabel alloc]init];
    CGFloat height = Height_NavBar;
    sepLabel.frame = CGRectMake(0, height-1, [UIScreen mainScreen].bounds.size.width, 1);
    sepLabel.backgroundColor = YBSectionLineColor;
    [self.topView addSubview:sepLabel];
    
}

- (void)configureBarWithTtitle:(NSString *)title rightBtnTilte:(NSString *)rightBtnTiltle andClick:(btnBlock)btnblock{
    self.topView = [[UIView alloc]init];
    self.topView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, Height_NavBar);
    self.topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.topView];
    
    self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftButton.frame = CGRectMake(0, Height_StatusBar, YBNavBar, YBNavBar);
    [self.leftButton setImage:[UIImage imageNamed:@"BACK"] forState:UIControlStateNormal];
    [self.leftButton addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:self.leftButton];
    
    UILabel * titleLabel = [[UILabel alloc]init];
    titleLabel.frame = CGRectMake(self.leftButton.frame.origin.x+self.leftButton.frame.size.width+10, Height_StatusBar, self.topView.frame.size.width-self.leftButton.frame.origin.x-self.leftButton.frame.size.width-100, YBNavBar);
    titleLabel.text = title;
    titleLabel.center = CGPointMake(self.topView.center.x, titleLabel.center.y);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:19.0*Device_Ccale];
    titleLabel.textColor = YBTextDarkColor;
    titleLabel.backgroundColor = [UIColor clearColor];
    [self.topView addSubview:titleLabel];
    self.titlelabel = titleLabel;
    
    UILabel * sepLabel = [[UILabel alloc]init];
    CGFloat height = Height_NavBar;
    sepLabel.frame = CGRectMake(0, height-1, [UIScreen mainScreen].bounds.size.width, 1);
    sepLabel.backgroundColor = YBSectionLineColor;
    [self.topView addSubview:sepLabel];
    
    
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightButton.frame = CGRectMake(self.topView.frame.size.width-20-90, Height_StatusBar, 90, YBNavBar);
    [self.rightButton setTitleColor:YBTextDarkColor forState:UIControlStateNormal];
    [self.rightButton setTitle:rightBtnTiltle forState:UIControlStateNormal];
    self.rightButton.titleLabel.font = [UIFont systemFontOfSize:19*Device_Ccale];
    [self.rightButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    [self.rightButton addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:self.rightButton];
    self.block = btnblock;
    
}
-(void)rightClick:(UIButton *)btn{
    self.block(btn);
}


//常规导航
-(void)configureBarWithTtitle:(NSString *)title{
    self.topView = [[UIView alloc]init];
    self.topView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, Height_NavBar);
    self.topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.topView];
    
    self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftButton.frame = CGRectMake(0, Height_StatusBar, YBNavBar, YBNavBar);
    [self.leftButton setImage:[UIImage imageNamed:@"BACK"] forState:UIControlStateNormal];
    [self.leftButton addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.topView addSubview:self.leftButton];
    
    self.titlelabel = [[UILabel alloc]init];
    self.titlelabel.frame = CGRectMake(self.leftButton.frame.origin.x+self.leftButton.frame.size.width, Height_StatusBar, self.topView.frame.size.width-self.leftButton.frame.origin.x-self.leftButton.frame.size.width-30, YBNavBar);
    self.titlelabel.text = title;
    self.titlelabel.center = CGPointMake(self.topView.center.x, self.titlelabel.center.y);
    self.titlelabel.textAlignment = NSTextAlignmentCenter;
    self.titlelabel.font = [UIFont systemFontOfSize:19*Device_Ccale];
    self.titlelabel.textColor = YBTextDarkColor;
    self.titlelabel.backgroundColor = [UIColor clearColor];
    [self.topView addSubview:self.titlelabel];
    
    UIView * sepLabel = [[UIView alloc]init];
    CGFloat height = Height_NavBar;
    sepLabel.frame = CGRectMake(0, height-1, [UIScreen mainScreen].bounds.size.width, 1);
    sepLabel.backgroundColor = YBSectionLineColor;
    [self.topView addSubview:sepLabel];
    self.bottomLine  = sepLabel;
    
    
}

-(void)backClick:(UIButton*)sender{
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}


/**
 *  计算文字尺寸
 *
 *  @param text    需要计算尺寸的文字
 *  @param font    文字的字体
 *  @param maxSize 文字的最大尺寸
 */
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingUsesDeviceMetrics attributes:attrs context:nil].size;
}

/**
 *  计算富文本字体高度
 *
 *  @param lineSpeace 行高
 *  @param font       字体
 *  @param width      字体所占宽度
 *
 *  @return 富文本高度
 */
-(CGFloat)getSpaceLabelHeightwithText:(NSString *)text Speace:(CGFloat)lineSpeace withFont:(UIFont*)font withWidth:(CGFloat)width {
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = lineSpeace;
    style.lineBreakMode = NSLineBreakByCharWrapping;
    [attributeString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, text.length)];
    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, text.length)];
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect rect = [attributeString boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:options context:nil];
    //判断内容是否只有一行 : (目前高度 - 字体高度) <= 行间距
    if ((rect.size.height - font.lineHeight) <= lineSpeace){
        //如果只有一行，进行判断内容中是否全部为汉字
        if ([self containChinese:text]) {
            //修正后高度为： 目前高度 - 一个行间距
            rect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height-lineSpeace);
        }
    }
    return rect.size.height;
}
//判断内容中是否全部为汉字
- (BOOL)containChinese:(NSString *)str {
    for(int i=0; i< [str length];i++){ int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff){
            return YES;
        }
    }
    return NO;
}

/*
-(void)nodataViewWithText:(NSString *)text imageName:(NSString *)imageName{
    if (!self.noDataView) {
        self.noDataView = [[UIView alloc]init];
        //    self.noDataView.hidden = YES;
        self.noDataView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:self.noDataView];
        [self.noDataView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.centerX.mas_equalTo(0);
            make.width.height.mas_equalTo(200);
        }];
        
        self.noDataImage = [[UIImageView alloc]init];
        [self.noDataView addSubview:self.noDataImage];
        [self.noDataImage sizeToFit];
        [self.noDataImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.centerY.mas_equalTo(-80);
        }];
        
       
//        [attributedString addAttribute:NSForegroundColorAttributeName value:YBTextDarkColor range:NSMakeRange(0, 7)];
//        [attributedString addAttribute:NSForegroundColorAttributeName value:YBTextLightColor range:NSMakeRange(7, [text length]-7)];
//        [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, 7)];
//        [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(7, [text length]-7)];

        self.nodataLabel = [[UILabel alloc]init];
        self.nodataLabel.font = [UIFont systemFontOfSize:15];
        self.nodataLabel.textColor = YBTextLightColor;
        self.nodataLabel.textAlignment = NSTextAlignmentCenter;
        self.nodataLabel.numberOfLines = 0;
        [self.noDataView addSubview:self.nodataLabel];
        [self.nodataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(self.noDataImage.mas_bottom).offset(25);
        }];
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:10.0];//调整行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    self.nodataLabel.attributedText = attributedString;
    self.noDataImage.image = [UIImage imageNamed:imageName];
    if (text.length > 0) {
        self.noDataView.hidden = NO;
    }else{
        self.noDataView.hidden = YES;
    }
}


-(void)onlyImageNodataViewWithImage:(NSString *)ImageName{
    CGFloat navheight = Height_NavBar;
    CGFloat safeHeight = Height_safeBottomBar;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, Height_NavBar, DeviceWidth, DeviceHeight-navheight-safeHeight)];
    view.backgroundColor = [UIColor blackColor];
    view.alpha = 0.3;
    [self.view addSubview:view];
    [self.view bringSubviewToFront:view];
    
    self.noDataView = [[UIView alloc]init];
    self.noDataView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.noDataView];
    self.noDataView.alpha = 1.0;
    [self.noDataView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(201*Device_Ccale);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(268*Device_Ccale);
        make.height.mas_equalTo(217*Device_Ccale);
    }];
    
    self.noDataImage = [[UIImageView alloc]init];
    self.noDataImage.image = [UIImage imageNamed:ImageName];
    [self.noDataView addSubview:self.noDataImage];
    [self.noDataImage sizeToFit];
    [self.noDataImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(0);
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:3.0 animations:^{
            self.noDataView.alpha = 0;
            view.alpha = 0;
            [self.noDataImage removeFromSuperview];
            [self.noDataView removeFromSuperview];
            [view removeFromSuperview];
        }completion:^(BOOL finished) {
          
        }];
    });
    
    
}
-(void)onlyImageActivityViewWithImage:(NSString *)ImageName{
    CGFloat navheight = Height_NavBar;
    CGFloat safeHeight = Height_safeBottomBar;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, Height_NavBar, DeviceWidth, DeviceHeight-navheight-safeHeight)];
    view.backgroundColor = [UIColor blackColor];
    view.alpha = 0.3;
    view.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapCancleView:)];
    [view addGestureRecognizer:tap];
    [self.view addSubview:view];
    [self.view bringSubviewToFront:view];
    
    self.noDataView = [[UIView alloc]init];
    self.noDataView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.noDataView];
    self.noDataView.alpha = 1.0;
    [self.noDataView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(201*Device_Ccale);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(268*Device_Ccale);
        make.height.mas_equalTo(217*Device_Ccale);
    }];
    
    self.noDataImage = [[UIImageView alloc]init];
    self.noDataImage.image = [UIImage imageNamed:ImageName];
    [self.noDataView addSubview:self.noDataImage];
    [self.noDataImage sizeToFit];
    [self.noDataImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(0);
    }];
}
-(void)tapCancleView:(UIGestureRecognizer *)tap{
    [tap.view removeFromSuperview];
    [self.noDataImage removeFromSuperview];
    [self.noDataView removeFromSuperview];
}
-(UIView *)onlyTextNodataViewWithText:(NSString *)text{
    if (!self.noDataView) {
        self.noDataView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DeviceWidth, 100)];
        self.noDataView.center = CGPointMake(DeviceWidth/2, 50);
        //    self.noDataView.hidden = YES;
        self.noDataView.backgroundColor = [UIColor clearColor];
        
        self.nodataLabel = [[UILabel alloc]init];
        self.nodataLabel.textColor = YBTextLightColor;
        [self.noDataView addSubview:self.nodataLabel];
        [self.nodataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.centerY.mas_equalTo(0);
        }];
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:10.0];//调整行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    self.nodataLabel.attributedText = attributedString;
    return self.noDataView;
}

-(UIView *)onlyTextNodataViewWithText:(NSString *)text ishidden:(BOOL)ishidden{
    if (!self.noDataView) {
        self.noDataView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DeviceWidth, 100)];
        self.noDataView.center = CGPointMake(DeviceWidth/2, 50);
        //    self.noDataView.hidden = YES;
        self.noDataView.backgroundColor = [UIColor clearColor];
        
        self.nodataLabel = [[UILabel alloc]init];
        self.nodataLabel.textColor = YBTextLightColor;
        [self.noDataView addSubview:self.nodataLabel];
        [self.nodataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.centerY.mas_equalTo(0);
        }];
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:10.0*Device_Ccale];//调整行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    self.nodataLabel.attributedText = attributedString;
    self.noDataView.hidden = ishidden;
    self.nodataLabel.hidden = ishidden;

    return self.noDataView;
}

-(void)onlyTextNodataViewWithText:(NSString *)text ishidden:(BOOL)ishidden superClass:(UIView *)view{
    if (!self.noDataView) {
        self.noDataView = [[UIView alloc]init];
        self.noDataView.backgroundColor = [UIColor clearColor];
        [view addSubview:self.noDataView];
        [self.noDataView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.centerX.mas_equalTo(0);
            make.width.mas_equalTo(DeviceWidth);
            make.height.mas_equalTo(100);
        }];
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:10.0];//调整行间距
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
        UILabel *nodataLabel = [[UILabel alloc]init];
        nodataLabel.attributedText = attributedString;
        nodataLabel.textColor = YBTextLightColor;
        [self.noDataView addSubview:nodataLabel];
        [nodataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.centerY.mas_equalTo(0);
        }];
    }
    self.noDataView.hidden = ishidden;
}

-(UIView *)AddtableViewFootView{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, DeviceWidth, 50)];
    view.backgroundColor = [UIColor clearColor];
    
    UILabel *footlabel = [[UILabel alloc]init];
    footlabel.text = @"我是有底线的";
    footlabel.textColor = pageTagColor;
    footlabel.font = [UIFont fontWithName:@"American Typewriter" size:13];
    footlabel.textAlignment = NSTextAlignmentCenter;
    [view addSubview:footlabel];
    [footlabel sizeToFit];
    [footlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.centerX.mas_equalTo(0);
    }];
    
    UIView *leftview = [[UIView alloc]init];
    leftview.backgroundColor = pageTagColor;
    [view addSubview:leftview];
    [leftview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(footlabel.mas_left).offset(-10);
        make.centerY.mas_equalTo(footlabel.mas_centerY);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(1);
    }];
    
    UIView *rightview = [[UIView alloc]init];
    rightview.backgroundColor = pageTagColor;
    [view addSubview:rightview];
    [rightview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(footlabel.mas_right).offset(10);
        make.centerY.mas_equalTo(footlabel.mas_centerY);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(1);
    }];
    return view;
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:Notification_otherDeviceUpNotification object:nil];
}

/**
 处理图片拉伸问题

 @param image 要拉伸的图片
 @param top 顶端盖高度
 @param bottom 底端盖高度
 @param left 左端盖宽度
 @param right 右端盖宽度
 @return 拉伸后的图片
 */
-(UIImage *)photoResizableImageWithCapInsetsWithimage:(UIImage *)image Top:(CGFloat)top bottom:(CGFloat)bottom left:(CGFloat)left right:(CGFloat)right{
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    // 指定为拉伸模式，伸缩后重新赋值
    return [image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)pathPngFile:(NSString *)image{
    
    NSString *bgImage = [[NSBundle mainBundle] pathForResource:image ofType:@"png"];
    UIImage *bgImg = [[UIImage alloc] initWithContentsOfFile:bgImage];
    
    return bgImg;
}
@end
