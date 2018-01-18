//
//  SKBaseAlertVipLimits.m
//  SKAlertVipLimits
//
//  Created by Sekorm on 2018/1/16.
//  Copyright © 2018年 Sekorm. All rights reserved.
//

#import "SKBaseAlertVipLimits.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define kIconWH 43


@interface SKBaseAlertVipLimits()

@property (nonatomic,strong) UIView *contentView; //容器
@property (nonatomic,strong) UIImageView *iconView; //vip专属图标
@property (nonatomic,strong) UILabel *titleLabel;   //标题文案
@property (nonatomic,strong) UIButton *loginBtn;
@property (nonatomic,strong) UIButton *registBtn;
@property (nonatomic,strong) UIButton *applyVipBtn; //申请Vip按钮

@property (nonatomic,assign) CGFloat contentH; //申请Vip按钮
@end

@implementation SKBaseAlertVipLimits

+ (instancetype)showHUDAddedTo:(UIView *)view {
    
    SKBaseAlertVipLimits *hud = [[self alloc] init];
    [view addSubview:hud];
    hud.alpha = 0;
    [hud showAnimated:YES];
    return hud;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
    
        UIView *bgView = [[UIView alloc] initWithFrame:self.bounds];
        [self addSubview:bgView];
        bgView.backgroundColor = [UIColor lightGrayColor];
        [bgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideAnimated:)]];
        bgView.alpha = 0.5;
        
        UIView *contentView = [[UIView alloc] initWithFrame:self.bounds];
        [self addSubview:contentView];
        contentView.backgroundColor = [UIColor whiteColor];
        self.contentView = contentView;
        
        UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(25, 10, kIconWH, kIconWH)];
        iconView.image = [UIImage imageNamed:@"icon_vip"];
        [self.contentView addSubview:iconView];

        UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [closeBtn setBackgroundImage:[UIImage imageNamed:@"icon_shut"] forState:UIControlStateNormal];
        [self.contentView addSubview:closeBtn];
        [closeBtn addTarget:self action:@selector(hideAnimated:) forControlEvents:UIControlEventTouchUpInside];
        closeBtn.frame = CGRectMake(SCREEN_WIDTH - 25 - 16, 10, 16, 16);
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(25, CGRectGetMaxY(iconView.frame) + 10, SCREEN_WIDTH - 50, 1)];
        [self.contentView addSubview:line];
        line.backgroundColor = [UIColor colorWithRed:193.0f/255.0f green:131.0f/255.0f blue:28.0f/255.0f alpha:1.0f];
        
        UILabel *titleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.backgroundColor = [UIColor whiteColor];
        
        UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [loginBtn setTitleColor:[UIColor colorWithRed:255.0f/255.0f green:109.0f/255.0f blue:0.0f/255.0f alpha:1.0f] forState:UIControlStateNormal];
        loginBtn.layer.borderColor = [[UIColor colorWithRed:255.0f/255.0f green:109.0f/255.0f blue:0.0f/255.0f alpha:0.8f] CGColor];
        loginBtn.layer.borderWidth = 0.5;
        loginBtn.layer.cornerRadius = 4;
        loginBtn.layer.masksToBounds = YES;
        [self.contentView addSubview:loginBtn];
        self.loginBtn = loginBtn;
        
        UIButton *registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [registBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        registBtn.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:109.0f/255.0f blue:0.0f/255.0f alpha:1.0f];
        registBtn.layer.cornerRadius = 4;
        registBtn.layer.masksToBounds = YES;
        [self.contentView addSubview:registBtn];
        self.registBtn = registBtn;
        
        UIButton *applyVipBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [applyVipBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        applyVipBtn.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:109.0f/255.0f blue:0.0f/255.0f alpha:1.0f];
        applyVipBtn.layer.cornerRadius = 4;
        applyVipBtn.layer.masksToBounds = YES;
        [self.contentView addSubview:applyVipBtn];
        self.applyVipBtn = applyVipBtn;
        self.applyVipBtn.hidden = YES;
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    
    _title = title;
    
    //vip
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:title];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:193.0f/255.0f green:131.0f/255.0f blue:28.0f/255.0f alpha:1.0f] range:NSMakeRange(0, title.length)];
   
    self.titleLabel.attributedText = attributedString;
    [self.titleLabel sizeToFit];
    self.titleLabel.bounds = CGRectMake(0, 0, CGRectGetWidth(self.titleLabel.bounds) + 40, CGRectGetHeight(self.titleLabel.bounds));
    self.titleLabel.center = CGPointMake(SCREEN_WIDTH * 0.5, kIconWH + 10 + [UIFont systemFontOfSize:17].lineHeight * 0.5);
}

//未登录状态
- (void)setLoginText:(NSString *)login registText:(NSString *)regist {
    
    self.loginBtn.hidden = NO;
    self.registBtn.hidden = NO;
    self.applyVipBtn.hidden = YES;
    
    if (login.length > 0) {
         [self.loginBtn setTitle:login forState:UIControlStateNormal];
    }
    if (regist.length > 0) {
        [self.registBtn setTitle:regist forState:UIControlStateNormal];
    }
}

//登录状态
- (void)setApplyText:(NSString *)apply {
    
    self.loginBtn.hidden = YES;
    self.registBtn.hidden = YES;
    self.applyVipBtn.hidden = NO;
    
    if (apply.length > 0) {
        [self.applyVipBtn setTitle:apply forState:UIControlStateNormal];
    }
}


// 特权文案
- (void)setPrivileges:(NSArray *)privileges {
    
    _privileges = privileges;
    
    CGFloat y = CGRectGetMaxY(self.titleLabel.frame) + 20;
  
    CGFloat iconX = 25;
    CGFloat tipX =  35;
    CGFloat dotWH = 5;
    
    for (int i = 0 ; i < privileges.count; i++) {
        
        //1.添加小圆点
        UIView *iconView = [[UIView alloc] initWithFrame:CGRectMake(iconX, 0, dotWH, dotWH)];
        [self.contentView addSubview:iconView];
        iconView.frame = CGRectMake(iconX, y + [UIFont systemFontOfSize:15].lineHeight * 0.5 - 2.5, dotWH, dotWH);
        iconView.backgroundColor = [UIColor colorWithRed:193.0f/255.0f green:131.0f/255.0f blue:28.0f/255.0f alpha:0.5f];
        iconView.layer.cornerRadius = 2.5;
        iconView.layer.masksToBounds = YES;
        
        //2.添加特权信息label
        UILabel *tip = [[UILabel alloc] init];
        tip.font = [UIFont systemFontOfSize:15];
        tip.numberOfLines = 0;
        [self.contentView addSubview:tip];
        tip.text = privileges[i];
        tip.textColor = [UIColor colorWithRed:102.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1.0f];
        CGSize size = [tip sizeThatFits:CGSizeMake(SCREEN_WIDTH - 70, CGFLOAT_MAX)];
        CGFloat tipHeight = 0;
        
        
        //2.1 计算文本高度,文本只有一行
        if (size.height <  2 * [UIFont systemFontOfSize:15].lineHeight) {
         
            tipHeight = [UIFont systemFontOfSize:15].lineHeight;
        
        //2.1 计算文本高度,文本有多行
        }else {
            
            NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:privileges[i]];
            
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            paragraphStyle.lineSpacing = 14.0f;
            paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
            [attributedString addAttributes:@{
                                              NSParagraphStyleAttributeName:paragraphStyle,
                                              } range:NSMakeRange(0, attributedString.length)];
            
            tip.attributedText =  attributedString;

            CGSize size = [tip sizeThatFits:CGSizeMake(SCREEN_WIDTH - 70, CGFLOAT_MAX)];
            tipHeight = size.height;
        }
        
        tip.frame = CGRectMake(tipX, y, SCREEN_WIDTH - 70, tipHeight);
        y = CGRectGetMaxY(tip.frame) + 16;
    }

    self.contentH = y + 4;
    
    [self setBtnFrames];
}

- (void)setBtnFrames {
    
    CGFloat btnW = (SCREEN_WIDTH - 60) * 0.5;
    
    CGFloat btnH = 45;
    
    self.loginBtn.frame = CGRectMake(25, self.contentH, btnW, btnH);
    
    self.registBtn.frame = CGRectMake(CGRectGetMaxX(self.loginBtn.frame) + 10, self.contentH, btnW, btnH);
    
    self.applyVipBtn.frame = CGRectMake(25, self.contentH, SCREEN_WIDTH - 50, btnH);
    
    self.contentH = CGRectGetMaxY(self.loginBtn.frame) + 20;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.contentView.frame = CGRectMake(0, SCREEN_HEIGHT - self.contentH, SCREEN_WIDTH, self.contentH);
}

- (void)hideAnimated:(BOOL)animated {
    
    [self removeFromSuperview];
}

- (void)showAnimated:(BOOL)animated {
    
    if (animated) {
        [UIView animateWithDuration:0.25 animations:^{
            self.alpha = 1.0f;
        }];
    }else {
        self.alpha = 1.0f;
    }
}




@end
