
#import <UIKit/UIKit.h>

typedef void(^setGestureBlock)(BOOL checkresult);

typedef enum{
    GestureViewControllerTypeSetting = 1,
    GestureViewControllerTypeLogin
}GestureViewControllerType;

typedef enum{
    buttonTagReset = 1,
    buttonTagManager,
    buttonTagForget

}buttonTag;

@interface GestureViewController : UIViewController

/**
 *  控制器来源类型
 */
@property (nonatomic, assign) GestureViewControllerType type;

@property (nonatomic, copy)setGestureBlock makeGestureResult;

@property (nonatomic,assign)BOOL showPath;

@property (nonatomic, copy)NSString * passwordSaveKey;

@end
