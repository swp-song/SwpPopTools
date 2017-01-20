//
//  ViewController.m
//  SwpPopToolsDemo
//
//  Created by swp_song on 2017/1/19.
//  Copyright © 2017年 swp_song. All rights reserved.
//

#import "ViewController.h"

#import "CustomView.h"
#import "SwpPopHeader.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIButton *popButton;

@property (nonatomic, strong) CustomView *customView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.customView.customViewClickEvent = ^(CustomView *customView) {
        [SwpPopTools swpPopToolsViewCloseAnimated:YES];
    };
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)didButton:(UIButton *)button {
    
    [SwpPopTools swpPopToolsView:self.customView animated:YES animatedCompletion:nil];
}



- (CustomView *)customView {
    
    return !_customView ? _customView = ({
        CustomView *customView = [CustomView new];
        customView.frame       = CGRectMake(0, 0, 200, 300);
        customView;
    }) : _customView;
}


@end
