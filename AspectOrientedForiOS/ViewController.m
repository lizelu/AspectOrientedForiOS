//
//  ViewController.m
//  AspectOrientedForiOS
//
//  Created by Mr.LuDashi on 2017/2/13.
//  Copyright © 2017年 ZeluLi. All rights reserved.
//

#import "ViewController.h"
#import "TestClass.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(21, 160, 280, 50)];
    label.text = @"文字阴影效果";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:[[UIFont familyNames] objectAtIndex:2] size:35];
    label.adjustsFontSizeToFitWidth = YES;
    label.numberOfLines = 0;
    
    [[label layer] setShadowOpacity:0.5f];
    [[label layer] setShadowColor:[UIColor blackColor].CGColor];
    [[label layer] setShadowOffset:CGSizeMake(5, 5)];
    [[label layer] setShadowOpacity:0.5f];
    
    [self.view addSubview:label];
    
    self.view.backgroundColor = [UIColor cyanColor];
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
