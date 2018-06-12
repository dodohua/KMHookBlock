//
//  TestViewController.m
//  kmHookBlockDemo
//
//  Created by allen du on 17/2/24.
//  Copyright © 2017年 km. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"TestView viewWillAppear");
    
}

-(void)setInterval:(NSInteger)interval
{
    NSLog(@"interval%lu",interval);
}

- (IBAction)btn1Click:(UIButton *)sender {
    NSLog(@"click btn1");
}
- (IBAction)btn2Click:(UIButton *)sender {
    NSLog(@"click btn2");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
