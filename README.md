BlockTimerExample
=================

This project contains a category in order to allow using NSTimer with blocks.

Usage example:
```
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.5f
                                                    userInfo:@"cenas"
                                                     repeats:YES
                                                    andBlock:^(NSTimer *timer, id userInfo) {
                                                        NSLog(@"timer:%@ - userinfo:%@",timer, userInfo);
                                                    }];
```

Just copy the NSTimer+Blocks files to your project
