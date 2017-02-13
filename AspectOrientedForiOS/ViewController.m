//
//  ViewController.m
//  AspectOrientedForiOS
//
//  Created by Mr.LuDashi on 2017/2/13.
//  Copyright © 2017年 ZeluLi. All rights reserved.
//

#import "ViewController.h"
#import "TestClass.h"
//#import "TestClass+Logging.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)tapTestButton:(id)sender {
    TestClass *testClass = [[TestClass alloc] init];
    [testClass testMethod];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
