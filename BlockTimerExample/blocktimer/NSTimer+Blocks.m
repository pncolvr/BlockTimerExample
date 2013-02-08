//
//  NSTimer+Blocks.m
//  BlockTimerTest
//
//  Created by Pedro Oliveira on 2/7/13.
//  Copyright (c) 2013 Pedro Oliveira. All rights reserved.
//

#import "NSTimer+Blocks.h"

typedef void (^POTimerBlock)(NSTimer *timer, id userInfo);

static NSString *kBlockIdentifier  = @"kBlockIdentifier";
static NSString *kUserInfoIdentier = @"kUserInfoIdentier";

@interface NSTimer (Private)
- (void) p_timerFiredWithUserInfo:(NSDictionary*) userInfo;
@end

@implementation NSTimer (Blocks)

+ (NSTimer*) scheduledTimerWithTimeInterval:(NSTimeInterval)seconds
                                   userInfo:(id) userInfo
                                    repeats:(BOOL)repeats
                                   andBlock:(void (^)(NSTimer *timer, id userInfo)) block
{
    SEL selector = @selector(p_timerFiredWithUserInfo:);
    
    NSMethodSignature *methodSignature = [NSTimer instanceMethodSignatureForSelector:selector];
    NSInvocation      *invocation      = [NSInvocation invocationWithMethodSignature:methodSignature];
    
    NSDictionary *auxInfo = @{kBlockIdentifier  : block,
                              kUserInfoIdentier : userInfo};
    
    /*
     The first two arguments are self and _cmd
     */
    [invocation setArgument:&auxInfo atIndex:2];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:seconds
                                                  invocation:invocation
                                                     repeats:repeats];
    invocation.target   = timer;
    invocation.selector = selector;
    
    return timer;
}

#pragma mark -
#pragma mark Private Methods

- (void) p_timerFiredWithUserInfo:(NSDictionary*) userInfo
{
    POTimerBlock block = userInfo[kBlockIdentifier];
    id userPassedInfo  = userInfo[kUserInfoIdentier];
    
    if (block) {
        block(self, userPassedInfo);
    }

}

@end
