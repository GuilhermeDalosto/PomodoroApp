//
//  ViewController.m
//  Remind
//
//  Created by Guilherme Martins Dalosto de Oliveira on 17/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import "ViewController.h"
#import "SettingsTVC.h"
#import <UserNotifications/UserNotifications.h>


@interface ViewController ()

@end

@implementation ViewController


//  var tableController : TableViewTaskViewController {
//      return self.children.first as! TableViewTaskViewController
//  }
//  

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    isGrantedNotificationAccess = false;
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    UNAuthorizationOptions options = UNAuthorizationOptionAlert    +UNAuthorizationOptionSound;
    
    [center requestAuthorizationWithOptions:options completionHandler:^(BOOL granted, NSError * _Nullable error) {
            isGrantedNotificationAccess = granted;
    }];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:TRUE];
}

- (IBAction)remindButton:(UIButton *)sender {
    NSString *significanceText = @"";
    NSString *title = [[self.childViewControllers.lastObject titleTextField]text ];
    NSString *subtitle = [[self.childViewControllers.lastObject descriptionTextField]text ];
    int time = [[self.childViewControllers.lastObject remindPicker]countDownDuration];
    int significance = [[self.childViewControllers.lastObject significanceSlider]value ];
    
    NSLog(@"%d",time);
    
    if (significance < 20){
        significanceText = @"Low";
    } else if (significance < 60){
        significanceText = @"Medium";
    } else{
        significanceText = @"High";
    }
    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc]init];
    
    content.title = title;
    content.subtitle = subtitle;
    content.body = [NSString stringWithFormat:@"%@ Priority",significanceText];    
    content.sound = [UNNotificationSound defaultSound];
    
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:time repeats:false];
    
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"UNLLocalNotification" content:content         trigger:trigger  ];
    
    [center addNotificationRequest:request withCompletionHandler:nil];
                                                  
    
    
    
    
    
}
@end
