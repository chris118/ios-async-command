//
//  ViewController.m
//  AsyncCommand
//
//  Created by xiaopeng on 2017/10/7.
//  Copyright © 2017年 putao. All rights reserved.
//

#import "ViewController.h"
#import "PTCommandHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendCommandTap:(id)sender {
    PTCommand *cmd = [[PTCommand alloc] init];
    cmd.uuid = @"12345678";
    cmd.msg = @"json";
    cmd.code = 0;
    
    [[PTCommandHelper shareInstance] sendCommand:cmd callback:^(PTCommand *command) {
        NSLog(@"response here");
    }];
}

// simulate the command callback
- (IBAction)callbackTap:(id)sender {
    PTCommand *cmd = [[PTCommand alloc] init];
    cmd.uuid = @"12345678";
    cmd.msg = @"response json";
    cmd.code = 0;
    [[PTCommandHelper shareInstance] response:cmd];
}
@end
