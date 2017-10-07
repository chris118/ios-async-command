//
//  PTCommandHelper.m
//  AsyncCommand
//
//  Created by xiaopeng on 2017/10/7.
//  Copyright © 2017年 putao. All rights reserved.
//

#import "PTCommandHelper.h"

@interface PTCommandHelper()

@property (nonatomic, strong)NSMutableDictionary* commands;

@end

@implementation PTCommandHelper
static PTCommandHelper *_instance;

+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [super allocWithZone:zone];
        }
    });
    return _instance;
}

+(instancetype)shareInstance
{
    return [[self alloc]init];
}

-(int) sendCommand:(PTCommand*) command callback:(PTCommandCallback)callback{
    if(self.commands == nil){
        self.commands = [NSMutableDictionary dictionary];
    }
    [self.commands setObject:callback forKey:command.uuid];
    
    // invoke im forwardMsg here
    
    return 0;
}

// IMCallback should invoke the response
-(void) response:(PTCommand*) command {
    PTCommandCallback callback = [self.commands objectForKey:command.uuid];
    callback(command);
    
    // after command response, remove the callback from the dict
    [self.commands removeObjectForKey:command.uuid];
}
@end
