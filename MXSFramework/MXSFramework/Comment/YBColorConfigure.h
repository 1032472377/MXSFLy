//
//  YBColorConfigure.h
//  YouBang
//
//  Created by UI on 16/10/13.
//
//

#ifndef YBColorConfigure_h
#define YBColorConfigure_h

#pragma mark -
#pragma mark - Default And System


// r g b 透明度默认为1.0
#define RGB(r, g, b)    [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.f]

//十六进制颜色值 透明度默认为1.0
#define COLORRGB(c)    [UIColor colorWithRed:((c>>16)&0xFF)/255.0	\
green:((c>>8)&0xFF)/255.0	\
blue:(c&0xFF)/255.0         \
alpha:1.0]

//十六进制颜色值 透明度
#define UIColorFromRGBA(rgbValue, alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 blue:((float)(rgbValue & 0x0000FF))/255.0 alpha:alphaValue]


//常用的颜色值
#define ALLBLUECOLOR    [UIColor colorWithRed:(0)/255.f green:(171)/255.f blue:(235)/255.f alpha:1.f]
#define ALLBeiJingCOLOR    [UIColor colorWithRed:(251)/255.f green:(251)/255.f blue:(251)/255.f alpha:1.f]

#define ALLLINECOLOR    [UIColor colorWithRed:(213)/255.f green:(213)/255.f blue:(213)/255.f alpha:1.f]

//#define TabBarSelectCOLOR    [UIColor colorWithRed:(243)/255.f green:(64)/255.f blue:(52)/255.f alpha:1.f]
//#define TabBarNormalCOLOR    [UIColor colorWithRed:(102)/255.f green:(102)/255.f blue:(102)/255.f alpha:1.f]
#define TabBarNormalCOLOR        UIColorFromRGBA(0x666666, 1)
#define TabBarSelectCOLOR         COLORRGB(0x00b3c7)

#define MgTagColor    COLORRGB(0xf5356b)
#define tobuydetailColor  COLORRGB(0xb2b2b2)
#define MGSeleTabBar      COLORRGB(0xfc5034)
#define YBTextDarkColor             COLORRGB(0x333333)
#define YBTextDarkTwoColor           COLORRGB(0x666666)
#define YBSectionLineColor           COLORRGB(0xf6f8fc)      //10 - 20 像素的分割线


#endif /* YBColorConfigure_h */
