
#import "GestureVerifyViewController.h"
#import "PCCircleViewConst.h"
#import "PCCircleView.h"
#import "PCLockLabel.h"
#import "GestureViewController.h"
    //#import "LNLoginViewController.h"

@interface GestureVerifyViewController ()<CircleViewDelegate>

/**
 *  文字提示Label
 */
@property (nonatomic, strong) PCLockLabel *msgLabel;
@property (nonatomic, strong) UILabel *resetLabel;
@property (nonatomic, strong) PCCircleView *lockView;

@end

@implementation GestureVerifyViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.view setBackgroundColor:CircleViewBackgroundColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"";
    PCCircleView *lockView = [[PCCircleView alloc] init];
    lockView.delegate = self;
    lockView.passwordSaveKey = self.passwordSaveKey;
    lockView.arrow = self.gesturePath;
    [lockView setType:CircleViewTypeVerify];
    self.lockView = lockView;
    [self.view addSubview:lockView];

    PCLockLabel *msgLabel = [[PCLockLabel alloc] init];
    msgLabel.frame = CGRectMake(0, 0, kScreenW, 14);
    msgLabel.font = [UIFont systemFontOfSize:16];
    msgLabel.center = CGPointMake(kScreenW/2, CGRectGetMinY(lockView.frame) - 60);
    [msgLabel showNormalMsg:gestureTextOldGesture];
    self.msgLabel = msgLabel;
    [self.view addSubview:msgLabel];

    [self buildUI];
}

- (void)setPasswordSaveKey:(NSString *)passwordSaveKey{
    _passwordSaveKey = passwordSaveKey;
    self.lockView.passwordSaveKey = passwordSaveKey;
}

- (void)setGesturePath:(BOOL)gesturePath{
    _gesturePath = gesturePath;
    self.lockView.arrow = gesturePath;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.isToSetNewGesture) {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }else{
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }

    if (self.isToSetNewGesture) {
        self.resetLabel.hidden = YES;
    }else{
        self.resetLabel.hidden = NO;
    }

}

- (void)buildUI{
        //    UIButton *resetBtn = [UIButton buttonWithType:UIButtonTypeCustom];

    UILabel *resetLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 100, 200, 30)];
    resetLabel.textAlignment = NSTextAlignmentCenter;
    resetLabel.center  = CGPointMake(self.view.center.x, [UIScreen mainScreen].bounds.size.height - 100);
    NSString *textStr = @"重新设置手势密码";
        // 下划线
    NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:textStr attributes:attribtDic];
        //赋值
    resetLabel.attributedText = attribtStr;
    resetLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resetGesture:)];
    gesture.numberOfTapsRequired = 1;
    [resetLabel addGestureRecognizer:gesture];
    self.resetLabel = resetLabel;
    [self.view addSubview:resetLabel];

}

- (void)resetGesture:(UITapGestureRecognizer *)gesture{
        //    LNLoginViewController *loginVC = [[LNLoginViewController alloc] init];
        //    loginVC.isForgetPwd = YES;
        //    [self.navigationController pushViewController:loginVC animated:YES];
    if (self.delegate && [self.delegate respondsToSelector:@selector(gestureVerifyVC:resetClick:)]) {
        [self.delegate gestureVerifyVC:self resetClick:nil];
    }

}

#pragma mark - login or verify gesture
- (void)circleView:(PCCircleView *)view type:(CircleViewType)type didCompleteLoginGesture:(NSString *)gesture result:(BOOL)equal
{
    if (type == CircleViewTypeVerify) {

        if (equal) {
            NSLog(@"验证成功");

            if (self.isToSetNewGesture) {
                GestureViewController *gestureVc = [[GestureViewController alloc] init];
                [gestureVc setType:GestureViewControllerTypeSetting];
                gestureVc.passwordSaveKey = self.passwordSaveKey;
                [self.navigationController pushViewController:gestureVc animated:YES];
            } else {
                [self.navigationController popToRootViewControllerAnimated:YES];
                if (self.checkedResult){
                    self.checkedResult(YES);
                }
            }

        } else {
            NSLog(@"密码错误！");
            [self.msgLabel showWarnMsgAndShake:gestureTextGestureVerifyError];
        }
    }
}

@end
