//
//  SKAlertVipLimits.h
//  SKAlertVipLimits
//
//  Created by Sekorm on 2018/1/16.
//  Copyright © 2018年 Sekorm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKAlertVipLimits : UIView

@property (nonatomic,copy) NSString *title; //标题

@property (nonatomic,strong) NSArray *privileges; //特权文案

+ (instancetype)showHUDAddedTo:(UIView *)view;

- (void)setLoginText:(NSString *)login registText:(NSString *)regist;

- (void)setApplyText:(NSString *)apply;

- (void)showAnimated:(BOOL)animated;

- (void)hideAnimated:(BOOL)animated;

@end
