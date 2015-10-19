//
//  ViewController.m
//  LaunchAdPage
//
//  Created by liyang on 15/9/14.
//  Copyright (c) 2015年 liyang. All rights reserved.
//

#import "ViewController.h"
#import "LaunchAdManager.h"

@interface ViewController ()

@property (nonatomic, strong) LaunchAdManager *launchManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIView * adView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:adView];
    
    self.launchManager = [LaunchAdManager shareManager];
    [self.launchManager showAdWithTimeInterval:2.0
                                      imageUrl:@"http://i1.topit.me/1/ee/a5/1131274301bb7a5ee1l.jpg"
                                        adView:adView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
