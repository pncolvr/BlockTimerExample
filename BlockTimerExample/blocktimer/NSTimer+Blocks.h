//
//  NSTimer+Blocks.h
//  BlockTimerTest
//
//  Created by Pedro Oliveira on 2/7/13.
//  Copyright (c) 2013 Pedro Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Blocks)

/*
 Creates and returns a new NSTimer object and schedules it on the current run loop in the default mode.
 After seconds seconds have elapsed, the timer fires, and block is executed.
 (If the timer is configured to repeat, there is no need to subsequently re-add the timer to the run loop.)
 */
+ (NSTimer*) scheduledTimerWithTimeInterval:(NSTimeInterval)seconds
                                   userInfo:(id) userInfo
                                    repeats:(BOOL)repeats
                                   andBlock:(void (^)(NSTimer *timer, id userInfo)) block;

@end
