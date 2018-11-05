//
//  ViewController.m
//  TimerCountDown
//
//  Created by volive solutions on 05/11/18.
//  Copyright © 2018 volive solutions. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSTimer *timer;
    int currMinute;
    int currSeconds;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _countDownTimer.text = @"2:00";
    currMinute=2;
    currSeconds=00;
    [self start];
}

-(void)start
{
    timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
    
}
-(void)timerFired
{
    if((currMinute>0 || currSeconds>=0) && currMinute>=0)
    {
        if(currSeconds==0)
        {
            currMinute-=1;
            currSeconds=59;
        }
        else if(currSeconds>0)
        {
            currSeconds-=1;
        }
        if(currMinute>-1)
            [_countDownTimer setText:[NSString stringWithFormat:@"%@%d%@%02d",@"Timer : ",currMinute,@":",currSeconds]];
        
    }
    else
    {
        [timer invalidate];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
