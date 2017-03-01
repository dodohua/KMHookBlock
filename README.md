# KMHookBlock
##中文简介：
###利用oc runtime的swizzle selector方法进行了block回到封装，让你像KVO观察一个属性变化一样，去观察任何一个selector的调用前和调用后的变化，我称之为KVS
##English introduction:
[![License](http://img.shields.io/badge/license-MIT-blue.svg)](http://opensource.org/licenses/MIT)              
###objective-c runtime hook selector using block,like `KVO`  to `KVS`. in the KMHookBlock,you can hook any select for a class as you want!

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
## License
(The MIT License)

Copyright (c) 2017 dodohua@yeah.net

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
