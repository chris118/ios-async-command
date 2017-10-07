//
//  PTCommand.h
//  AsyncCommand
//
//  Created by xiaopeng on 2017/10/7.
//  Copyright © 2017年 putao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PTCommand : NSObject

@property(nonatomic, assign)NSUInteger code;
@property(nonatomic, copy)NSString* uuid;
@property(nonatomic, copy)NSString* msg;

@end
