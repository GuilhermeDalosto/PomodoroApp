//
//  UITableViewController+SettingsTVC.h
//  Remind
//
//  Created by Guilherme Martins Dalosto de Oliveira on 18/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingsTVC : UITableViewController

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;

@property (weak, nonatomic) IBOutlet UIDatePicker *remindPicker;

@property (weak, nonatomic) IBOutlet UISlider *significanceSlider;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;



@end

NS_ASSUME_NONNULL_END
