//
//  PTCommandHelper.h
//  AsyncCommand
//
//  Created by xiaopeng on 2017/10/7.
//  Copyright © 2017年 putao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PTCommand.h"

typedef void(^PTCommandCallback)(PTCommand* command);


@interface PTCommandHelper : NSObject

+(instancetype)shareInstance;

-(int) sendCommand:(PTCommand*) command callback:(PTCommandCallback)callback;
-(void) response:(PTCommand*) command;

@end
