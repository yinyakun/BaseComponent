//
//  LNPSRefFileServer.m
//  LNPSRefProject
//
//  Created by yakun yin on 2017/6/13.
//  Copyright © 2017年 yakun yin. All rights reserved.
//

#import "LNPSRefFileServer.h"

@implementation LNPSRefFileServer
@synthesize developApiBaseUrl = _developApiBaseUrl,testApiBaseUrl = _testApiBaseUrl,prereleaseApiBaseUrl = _prereleaseApiBaseUrl,releaseApiBaseUrl = _releaseApiBaseUrl,hotfixApiBaseUrl = _hotfixApiBaseUrl;

- (NSString *)developApiBaseUrl {
    if (_developApiBaseUrl == nil) {
        _developApiBaseUrl = @"http://psref.lenovo.com";
    }
    return _developApiBaseUrl;
}

- (NSString *)testApiBaseUrl {
    if (_testApiBaseUrl == nil) {
        _testApiBaseUrl = @"http://psref.lenovo.com";
    }
    return _testApiBaseUrl;
}

- (NSString *)prereleaseApiBaseUrl {
    if (_prereleaseApiBaseUrl == nil) {
        _prereleaseApiBaseUrl = @"http://psref.lenovo.com";
    }
    return _prereleaseApiBaseUrl;
}

- (NSString *)hotfixApiBaseUrl{
    if (_hotfixApiBaseUrl == nil) {
        _hotfixApiBaseUrl = @"http://psref.lenovo.com";
    }
    return _hotfixApiBaseUrl;
}

- (NSString *)releaseApiBaseUrl {
    if (_releaseApiBaseUrl == nil) {
        _releaseApiBaseUrl = @"http://psref.lenovo.com";
    }
    return _releaseApiBaseUrl;
}

@end
