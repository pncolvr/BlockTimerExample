BlockTimerExample
=================

This project contains a category in order to allow using NSTimer with blocks.

Usage example:
```Objective-C
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                    userInfo:@"Hello World!"
                                                     repeats:YES
                                                    andBlock:^(NSTimer *timer, id userInfo) {
                                                        NSLog(@"timer:%@ - userinfo:%@",timer, userInfo);
                                                    }];
```

Just copy the NSTimer+Blocks files to your project
