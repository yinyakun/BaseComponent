//
//  NSString+Utils.h
//  LNPSRefProject
//
//  Created by yakun yin on 2017/6/14.
//  Copyright © 2017年 yakun yin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Utils)

/**
 base64 编码

 @return 编码后的结果
 */
- (NSString *)base64Encode;

/**
 Base64 解码

 @return 解码后的字符串
 */
- (NSString *)base64Decode;

/**
 字符串是否为空

 @return 结果
 */
- (BOOL)isEmpty;

/**
 URL 解码
 
 @return 解码后的结果
 */
-(NSString *)URLDecode;

/**
 字符串是否相同

 @param str 要比较的字符串
 @return 结果
 */
-(BOOL)isSame:(NSString *)str;

/// 只包含数字和英文字符

/**
 只包含数字和英文字符

 @return 结果
 */
- (BOOL)validateNumberAndWord;

/**
 *  加密方法
 *
 *  @param str   需要加密的字符串
 *  @param path  '.der'格式的公钥文件路径
 */
+ (NSString *)encryptString:(NSString *)str publicKeyWithContentsOfFile:(NSString *)path;

/**
 *  解密方法
 *
 *  @param str       需要解密的字符串
 *  @param path      '.p12'格式的私钥文件路径
 *  @param password  私钥文件密码
 */
+ (NSString *)decryptString:(NSString *)str privateKeyWithContentsOfFile:(NSString *)path password:(NSString *)password;

/**
 *  加密方法
 *
 *  @param str    需要加密的字符串
 *  @param pubKey 公钥字符串
 */
+ (NSString *)encryptString:(NSString *)str publicKey:(NSString *)pubKey;

/**
 *  解密方法
 *
 *  @param str     需要解密的字符串
 *  @param privKey 私钥字符串
 */
+ (NSString *)decryptString:(NSString *)str privateKey:(NSString *)privKey;
@end
