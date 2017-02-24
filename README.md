# KMHookBlock
##objective-c runtime hook selector using block,like KVO  to KVS                
##in the KMHookBlock,you can hook any select for a class as you want

Example：
```objective-c
#import "NSObject+kmHookBlock.h"
TestViewController *testHook;
//we want to hook testhook viewWillAppear selector
//just code like this:
[testHook hookSelectorWithBlock:PAIR_LIST {
        @selector(viewWillAppear:),
        BLOCK_CAST ^void (id slf,BOOL animated) {
            NSLog(@"hook befor viewWillAppear");
            performSuperSelector(slf, @selector(viewWillAppear:), void,animated);
            NSLog(@"hook after viewWillAppear");
        },
        NIL_PAIR}];
 ```
