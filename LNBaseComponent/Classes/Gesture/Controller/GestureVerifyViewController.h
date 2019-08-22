
#import <UIKit/UIKit.h>
@class GestureVerifyViewController;
@protocol GestureVerifyVCDelegate <NSObject>

- (void)gestureVerifyVC:(GestureVerifyViewController *)vc resetClick:(NSDictionary *)reset;

@end

typedef void(^checkGestureResult)(BOOL result);

@interface GestureVerifyViewController : UIViewController

@property (nonatomic,copy)checkGestureResult checkedResult;
@property (nonatomic, assign) BOOL isToSetNewGesture;
@property (nonatomic,assign)BOOL gesturePath;
@property (nonatomic, weak)id<GestureVerifyVCDelegate> delegate;

@property (nonatomic, copy)NSString * passwordSaveKey;
@end
