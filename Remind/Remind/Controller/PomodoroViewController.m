//
//  UIViewController+PomodoroViewController.m
//  Remind
//
//  Created by Guilherme Martins Dalosto de Oliveira on 18/02/20.
//  Copyright © 2020 Guilherme Martins Dalosto de Oliveira. All rights reserved.
//

#import "PomodoroViewController.h"
#import "UIKit/UIKit.h"

@implementation PomodoroViewController

int timerScheduled = 60*25;
int timerScheduled2 = 60;
int auxTimer = 0;
bool reflectionTime = false;
int auxTS2 = 60;

- (void)viewWillAppear:(BOOL)animated{
    [[self TimeStudy]setText:@"25:00"];
    [[self TimeReflection]setText:@"01:00"];
    
}

- (void)viewDidLoad{
    
    
    
}

- (IBAction)StudyTimePicker:(id)sender {
    timerScheduled = [sender countDownDuration];
    int minutes = [sender  countDownDuration]/60;
    int seconds = fmod([sender  countDownDuration],60);
    [[self TimeStudy]setText:([NSString stringWithFormat:@"%d:%.2d", minutes,seconds])];
}

- (IBAction)ReflectionTimePicker:(id)sender {
    timerScheduled2 = [sender countDownDuration];
    auxTS2 = timerScheduled2;
    int minutes = [sender  countDownDuration]/60;
    int seconds = fmod([sender  countDownDuration],60);
    [[self TimeReflection]setText:([NSString stringWithFormat:@"%d:%.2d", minutes,seconds])];
    
    
}





- (IBAction)StartStudy:(UIButton *)sender {
    [self startTime];
}

- (void) startTime {
    int timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:true block:^(NSTimer * _Nonnull timer) {
        auxTimer += 1;
        if (!reflectionTime){
            timerScheduled -= 1;
            [[self TimeStudy]setText:([NSString stringWithFormat:@"%.2d:%.0f", timerScheduled/60,fmod(timerScheduled,60)])];
        } else{
            timerScheduled2 -= 1;
            [[self TimeReflection]setText:([NSString stringWithFormat:@"%.2d:%.0f", timerScheduled2/60,fmod(timerScheduled2,60)])];
            
            if (timerScheduled2 == 0){
                reflectionTime = false;
                timerScheduled2 = auxTS2;
                auxTimer = 60*5;
            }
            
            
        }
        
        if (auxTimer >= 60){
            reflectionTime = true;
        }
        
        
        
        
        
        
        if (timerScheduled == 0){
            [timer invalidate];
            [[self TimeStudy]setText:@"Acabou o tempo."];
        }
        
        
    }];
    
    
}



@end

