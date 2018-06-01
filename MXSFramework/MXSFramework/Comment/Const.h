//
//  Const.h
//  FlowerFairy1_X
//
//  Created by David on 15/2/9.
//  Copyright . All rights reserved.
//

#ifndef MXS_Const_h
#define MXS_Const_h
#import "YBColorConfigure.h"
#ifdef DEBUG

//#define NSLog(format, ...) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )
#else
#define NSLog(format, ...)
#endif

// 日志输出
#ifdef DEBUG
#define Plog(...) NSLog(__VA_ARGS__)
#else
#define Plog(...)
#endif

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define KAppDelegate ((AppDelegate*)[UIApplication sharedApplication].delegate)

//状态条的高
#define StatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
//得到屏幕bounds
#define SCREEN_SIZE [UIScreen mainScreen].bounds
//得到屏幕height
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
//得到屏幕width
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define fontSizeScale    [UIScreen mainScreen].bounds.size.width/375

//适配iphonex
#define IS_IPHONE_X (SCREEN_HEIGHT == 812.0f) ? YES : NO

#define Height_NavContentBar 44.0f

#define Height_StatusBar (IS_IPHONE_X==YES)?44.0f:20.0f

#define Height_NavBar (IS_IPHONE_X==YES)?88.0f:64.0f
#define Height_TabBar (IS_IPHONE_X==YES)?83.0f:49.0f
#define Height_safeBottomBar (IS_IPHONE_X==YES)?34.0f:0.0f


#define  DefaultAdressBookPage  500  //默认每次上传500个记录
#define YBDeviceType    @"1"
#define kMaxLength 15
#define DefaultPageSize         10
#define DefaultTwentyPageSize         20

#define DefaultPlatform         [NSNumber numberWithInt:1]
#define DefaultSystemVersion    [[UIDevice currentDevice]systemVersion]
#define DeviceHeight            [[UIScreen mainScreen] bounds].size.height
#define DeviceWidth             [[UIScreen mainScreen] bounds].size.width
#define DeviceScale             [UIScreen mainScreen].scale
#define Device_Ccale    DeviceWidth/375
#define DefaultNavHeight    64.0
#define  DefaultTabbarHeight 49

#define DefaultAppVersion       [NSString stringWithFormat:@"%@",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]]
//#define DefaultAppVersion       [NSString stringWithFormat:@"%@(%@)",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"],[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]]
#define IsIphone6           [[[UIApplication sharedApplication] keyWindow] bounds].size.width == 375
#define IsIphone6Plus       [[[UIApplication sharedApplication] keyWindow] bounds].size.width > 375
#define IsIphone5           [[[UIApplication sharedApplication] keyWindow] bounds].size.width == 320
#define IsIphone4           [[[UIApplication sharedApplication] keyWindow] bounds].size.height <= 480
#define kAdjustLength(x)        DeviceWidth*(x)/375
#define IOS8_10 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 && [[UIDevice currentDevice].systemVersion doubleValue] < 10.0)
#define IOS10 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)

#define IS_IOS10 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10)
#define IS_IOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8)

#define IS_IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] == 7)


//-----------------------------------------------------------
#pragma mark -
#pragma mark - Key

//登录获取的信息
//############################################################
#define Key_age             @"age"
#define Key_birthday        @"birthday"
#define Key_constellation   @"constellation"
#define Key_create_time        @"create_time"
#define Key_dev_code        @"dev_code"
#define Key_easemob_id        @"easemob_id"

#define Key_follow        @"follow"
#define Key_gender        @"gender"
#define Key_height        @"height"
#define Key_ID        @"id"
#define Key_im_token        @"im_token"
#define Key_income        @"income"
#define Key_interest        @"interest"
#define Key_is_effective        @"is_effective"
#define Key_is_first_login        @"is_first_login"
#define Key_is_register_easemob        @"is_register_easemob"
#define Key_job_id        @"job_id"
#define Key_job_name        @"job_name"
#define Key_login_time        @"login_time"
#define Key_login_type        @"login_type"
#define Key_password        @"password"
#define Key_phone        @"phone"
#define Key_pic        @"pic"
#define Key_qq_open_id        @"qq_open_id"
#define Key_real_name        @"real_name"
#define Key_state        @"state"
#define Key_tags        @"tags"
#define Key_to_follow        @"to_follow"
#define Key_token        @"token"
#define Key_user_name        @"user_name"
#define Key_wb_open_id        @"wb_open_id"
#define Key_weight        @"weight"
#define Key_wx_open_id        @"wx_open_id"
//############################################################


//Notification
#define Notification_loginNotification @"loginNotification"//登录成功通知
#define Notification_loginOutNotification @"loginOutNotification"//退出通知
#define Notification_otherDeviceUpNotification @"otherDeviceUpNotification"//账号在别的设备登录
#define Notification_lonAndLatNotification @"lonAndLatNotification"//有经纬度或者经纬度发生改变时的通知




#define Key_IsHide         @"isHide"   //审核的时候需要隐藏一些功能  0隐藏 1显示

#define Error_Bad_Net @"您的操作无法完成,请在网络畅通网速良好的环境下重新操作"

#endif
