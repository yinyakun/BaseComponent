//
//  LNMacros.h
//  乐聊Cochat
//
//  Created by yakun yin on 2017/3/27.
//  Copyright © 2017年 www.samsundot.com. All rights reserved.
//

#ifndef LNMacros_h
#define LNMacros_h

#define SCREENWIDTH          [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT          [UIScreen mainScreen].bounds.size.height


#define k2G                             (long long)2*1024*1024*1024

#define kFileSeperator                  @"___"

typedef NS_ENUM(NSUInteger, fileLastName) {
    fileLastNameNone = 100,
    fileLastNameMov  = 101,
    fileLastNameHtml = 102,
    fileLastNameZip = 103,
    fileLastNameExcel = 104,
    fileLastNameDoc = 105,
    fileLastNamePPT  = 106,
    fileLastNameRar = 107,
    fileLastNameMp3 = 108,
    fileLastNamePdf = 109,
    fileLastNameApk = 110,
    fileLastNameJpg = 111,
};

#endif /* LNMacros_h */

