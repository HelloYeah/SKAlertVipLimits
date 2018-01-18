//
//  ViewController.m
//  SKAlertVipLimits
//
//  Created by Sekorm on 2018/1/16.
//  Copyright © 2018年 Sekorm. All rights reserved.
//

#import "ViewController.h"
#import "SKAlertVipLimits.h"

@interface ViewController ()<UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView.delegate = self;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0:{
            
            SKAlertVipLimits *hud = [SKAlertVipLimits showHUDAddedTo:self.navigationController.view];
            hud.title = @"VIP专属资料特权";
            hud.privileges = @[@"畅享无限级下载资料",
                               @"免费下载数百家原厂秘密级资料 ",
                               @"收藏/下载资料支持APP和PC端云同步",
                               @"一键分享好友或工作邮箱",
                               @"专享资料相关的经验值福利"];
            [hud setLoginText:@"立即登录" registText:@"注册,免费申请VIP"];
        }
            break;
            
        case 1:{
            
            SKAlertVipLimits *hud = [SKAlertVipLimits showHUDAddedTo:self.navigationController.view];
            hud.title = @"VIP专属资料特权";
            hud.privileges = @[@"畅享无限级下载资料",
                               @"免费下载数百家原厂秘密级资料 ",
                               @"收藏/下载资料支持APP和PC端云同步",
                               @"一键分享好友或工作邮箱",
                               @"专享资料相关的经验值福利"];
            [hud setApplyText:@"免费申请VIP，畅享无限极资料特权"];
        }
            
            break;
            
        case 2:{
            
            SKAlertVipLimits *hud = [SKAlertVipLimits showHUDAddedTo:self.navigationController.view];
            hud.title = @"VIP专属活动福利";
            hud.privileges = @[@"每年百场电商活动、百场高端沙龙、研讨会仅为VIP留席",
                               @"每年VIP狂欢派对",
                               @"环球游、iPhone、MacBook、购物卡等多重大奖等你瓜分",
                               ];
            [hud setLoginText:@"立即登录" registText:@"免费申请VIP"];
  
            
        }
             break;
            
            
        case 3:{
            
            SKAlertVipLimits *hud = [SKAlertVipLimits showHUDAddedTo:self.navigationController.view];
            hud.title = @"VIP专属活动福利";
            hud.privileges = @[@"每年百场电商活动、百场高端沙龙、研讨会仅为VIP留席",
                               @"每年VIP狂欢派对",
                               @"环球游、iPhone、MacBook、购物卡等多重大奖等你瓜分",
                               ];
            [hud setApplyText:@"免费申请VIP，畅享特权"];
        }
            
            break;
            
        case 4:{
            
            SKAlertVipLimits *hud = [SKAlertVipLimits showHUDAddedTo:self.navigationController.view];
            hud.title = @"VIP专属提问/回答特权";
            hud.privileges = @[@"百人技术专家团队24H在线答疑",
                               @"与百万工程师交流经验",
                               @"专享提问/回答经验值福利",];
            [hud setLoginText:@"立即登录" registText:@"注册,免费申请VIP"];
            
        }
            break;
            
        case 5:{
            
            SKAlertVipLimits *hud = [SKAlertVipLimits showHUDAddedTo:self.navigationController.view];
            hud.title = @"VIP专属提问/回答特权";
            hud.privileges = @[@"百人技术专家团队24H在线答疑",
                               @"与百万工程师交流经验",
                               @"专享提问/回答经验值福利",];
            [hud setApplyText:@"免费申请VIP，畅享无限极资料特权"];
        }
            break;
            
        default:
            break;
    }
}


@end
