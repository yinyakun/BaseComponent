
#import "PCCircleViewConst.h"
//#import "LNSetGestureRequest.h"
//#import "LNCheckGestureRequest.h"
//#import "LNLoginInfoHelper.h"
//#import <SVProgressHUD.h>

@implementation PCCircleViewConst

+ (void)saveGesture:(NSString *)gesture Key:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setObject:gesture forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)getGestureWithKey:(NSString *)key
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

//+ (void)saveGestureToNet:(NSString *)gesture
//{
//
//    LNSetGestureRequest *request = [[LNSetGestureRequest alloc] initWithUserId:[LNLoginInfoHelper shareHelper].loadModel.userId gestureCode:gesture];
//
//    [request ln_startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
//        if ([[request.responseJSONObject objectForKey:@"code"] integerValue] == 200){
//            NSLog(@"手势密码设置成功");
//        }else{
//            NSLog(@"手势密码设置失败");
//        }
//    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
//        NSLog(@"手势密码设置失败,有其他原因");
//    }];
//
//}
//
//+ (void)checkGesture:(NSString *)gesture withCallBack:(checkResultCB)cb
//{
//    [SVProgressHUD showWithStatus:@"Unlocking..."];
//    LNLoginModel *loginModel = [LNLoginInfoHelper shareHelper].loadModel;
//    LNCheckGestureRequest *request = [[LNCheckGestureRequest alloc] initWithLoginId:loginModel.loginId gestureCode:gesture appKey:nil packageId:nil];
//
//    [request ln_startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
//        [SVProgressHUD dismiss];
//        if ([[request.responseJSONObject objectForKey:@"code"] integerValue] == 200){
//            NSLog(@"获取手势密码成功");
//            cb(YES);
//        }else{
//            NSLog(@"获取手势密码失败");
//            cb(NO);
//        }
//    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
//        [SVProgressHUD dismiss];
//        cb(NO);
//    }];
//}
@end
