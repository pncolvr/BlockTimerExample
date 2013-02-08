//
//  POViewController.m
//  BlockTimerExample
//
//  Created by Pedro Oliveira on 2/8/13.
//  Copyright (c) 2013 Pedro Oliveira. All rights reserved.
//

#import "POViewController.h"
#import "NSTimer+Blocks.h"

@interface POViewController ()
@property (strong, nonatomic) IBOutlet UILabel *timerLabel;
@end

@implementation POViewController {
    NSTimer *_timer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                userInfo:[NSDate date]
                                                 repeats:YES
                                                andBlock:^(NSTimer *timer, NSDate *initialDate) {
                                                    
                                                    NSUInteger elapsedSeconds = [[NSDate date] timeIntervalSinceDate:initialDate];
                                                    NSUInteger h = elapsedSeconds / 3600;
                                                    NSUInteger m = (elapsedSeconds / 60) % 60;
                                                    NSUInteger s = elapsedSeconds % 60;
                                                    
                                                    NSString *formattedTime = [NSString stringWithFormat:@"%02u:%02u:%02u", h, m, s];
                                                    _timerLabel.text = formattedTime;
                                                    
                                                }];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
