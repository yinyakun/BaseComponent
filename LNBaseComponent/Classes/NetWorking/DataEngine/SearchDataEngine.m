//
//  SearchDataEngine.m
//  NetWorking
//
//  Created by Yasin on 16/4/28.
//  Copyright © 2016年 Yasin. All rights reserved.
//

#import "SearchDataEngine.h"

@implementation SearchDataEngine
+ (YABaseDataEngine *)control:(NSObject *)control
                    searchKey:(NSString *)searchKey
                     complete:(CompletionDataBlock)responseBlock
{
    NSDictionary *param = @{@"scope":@"103",
                            @"format":@"json",
                            @"appid":@"379020",
                            @"bk_key":searchKey,
                            @"bk_length":@"600"};
    return [YABaseDataEngine control:control callAPIWithServiceType:YAServiceFWZ path:@"api/openapi/BaikeLemmaCardApi" param:param requestType:YAAPIManagerRequestTypePost alertType:DataEngineAlertType_None  dataType:LNPSRefDataTypeXML progressBlock:nil complete:responseBlock errorButtonSelectIndex:nil];
}
@end
