//
//  YBSizeConfigure.h
//  YouBang
//
//  Created by mac on 17/5/2.
//
//

#ifndef YBSizeConfigure_h
#define YBSizeConfigure_h


//我们项目效果图依照6、6s 适配的屏幕 750x1334==>375 *667
//比列关系 设计师的宽度 / 依照的屏幕屏幕宽度 ＝ 将要显示的屏幕宽度 /当前设备的宽度
// 将要显示的屏幕宽度 =设计师的宽度 /依照的屏幕屏幕宽度 *当前设备的宽度
//宽
#define SCREEN_W_RATE(value) ((value)/375.0*[UIScreen mainScreen].bounds.size.width)
//高
#define    SCREEN_H_RATE(value) (ceil((value)/667.0*[UIScreen mainScreen].bounds.size.height))

/*
 先导入约束文件
 view        父视图
 sep         左边距
 height      高度
 */
#define  YBCellLine(view,sep,h)   UIView * line = [[UIView alloc]init];line.backgroundColor = COLORRGB(0xf6f8fc);[view addSubview:line];[line mas_makeConstraints:^(MASConstraintMaker *make) {make.left.mas_equalTo(sep);make.right.mas_equalTo(0);make.bottom.mas_equalTo(0);make.height.mas_equalTo(h);}];

#endif /* YBSizeConfigure_h */
