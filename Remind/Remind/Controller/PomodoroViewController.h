//
//  UIViewController+PomodoroViewController.h
//  Remind
//
//  Created by Guilherme Martins Dalosto de Oliveira on 18/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PomodoroViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *StudyPicker;
@property (weak, nonatomic) IBOutlet UIDatePicker *ReflectionPicker;
@property (weak, nonatomic) IBOutlet UILabel *TimeStudy;
@property (weak, nonatomic) IBOutlet UILabel *TimeReflection;

@property (weak, nonatomic) IBOutlet UIButton *StartButton;



@end

NS_ASSUME_NONNULL_END
