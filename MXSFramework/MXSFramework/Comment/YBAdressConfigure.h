//
//  YBAdressConfigure.h
//  YouBang
//
//  Created by MiaoLizhuang on 2016/10/11.
//
//

#ifndef YBAdressConfigure_h
#define YBAdressConfigure_h

#pragma mark - app 环境设置

/*
 调试模式
 YBTestService 0 测试环境
 
 
 YBTestService 1 正式环境  调试模式为真机
 
 */
#define YBTestService    0     //0:测试环境   1:正式环境

#define ServiceIp(a,b)    (YBTestService == 1?a:b)
//接口

//首页精选
#define mainSelect     ServiceIp(@"",@"")

#endif /* YBAdressConfigure_h */
