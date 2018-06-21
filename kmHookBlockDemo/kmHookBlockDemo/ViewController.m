//
//  ViewController.m
//  kmHookBlockDemo
//
//  Created by allen du on 17/2/23.
//  Copyright © 2017年 km. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
#import "NSObject+kmHookBlock.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)testHookClick:(UIButton *)sender {
    TestViewController *testHook = [[TestViewController alloc]initWithNibName:@"TestViewController" bundle:nil];
    [self.navigationController pushViewController:testHook animated:YES];
//    [TestViewController hookSelectorWithBlock:PAIR_LIST {
//        @selector(setInterval:),
//        BLOCK_CAST ^void (id slf,NSInteger interval) {
//            NSLog(@"hook befor setInterval,setInterval%lu",interval);
//            performSuperSelector(slf, @selector(setInterval:), void,interval);
//            NSLog(@"hook after setInterval");
//        },
//        NIL_PAIR}];
    Class tarClass = NSClassFromString(@"TestViewController");
    [tarClass hookSelectorWithBlock:PAIR_LIST {
        @selector(viewWillAppear:),
        BLOCK_CAST ^void (id slf,BOOL animated) {
            NSLog(@"hook befor viewWillAppear");
            performSuperSelector(slf, @selector(viewWillAppear:), void,animated);
            NSLog(@"hook after viewWillAppear");
        },
        NIL_PAIR}];
    
    
    [tarClass hookSelectorWithBlock:PAIR_LIST {
        @selector(btn1Click:),
        BLOCK_CAST ^void (id slf,UIButton *sender) {
            NSLog(@"hook befor btn1Click");
            long long interval = 900;
            performSelector(slf, @selector(setInterval:), void,interval);
            NSInteger val = performSelector(slf, @selector(interval), NSInteger,nil);
            NSLog(@"hookinterval%lu",val);
            
            performSuperSelector(slf, @selector(btn1Click:), void,sender);
            
            //            performSuperSelector(slf, @selector(mobStarStatistics), void,nil);
            NSLog(@"hook after btn1Click");
        },
        NIL_PAIR}];
    
    [tarClass hookSelectorWithBlock:PAIR_LIST {
        @selector(btn2Click:),
        BLOCK_CAST ^void (id slf,UIButton *sender) {
            NSLog(@"hook befor btn2Click");
            performSuperSelector(slf, @selector(btn2Click:), void,sender);
            NSLog(@"hook after btn2Click");
        },
        NIL_PAIR}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
