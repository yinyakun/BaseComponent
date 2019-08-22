//
//  LNConsts.h
//  乐聊Cochat
//
//  Created by yakun yin on 2017/3/22.
//  Copyright © 2017年 www.samsundot.com. All rights reserved.
//
//使用方法参考 http://www.jianshu.com/p/f83335e036b5
#import <Foundation/Foundation.h>

@interface LNConsts : NSObject
extern NSString * const                  filePath;          //文件路径
extern NSString * const                  kChatSelectFileNotification;
extern NSString * const                  kChatUploadProgressChangeNotification;
extern NSString * const                  kChatUploadCancelNotification;       //取消发送
extern NSString * const                  kChatUploadSuccessNotification;
extern NSString * const                  kChatUploadFailNotification;       //发送失败
extern NSString * const                  kUploadFinishNotification;       //发送失败


@end
