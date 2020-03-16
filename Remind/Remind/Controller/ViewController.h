//
//  ViewController.h
//  Remind
//
//  Created by Guilherme Martins Dalosto de Oliveira on 17/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property UITableViewController *tableView;
@property (weak, nonatomic) IBOutlet UIButton *remindButton;

- (IBAction)remindButton:(UIButton *)sender;


@end

bool isGrantedNotificationAccess;
