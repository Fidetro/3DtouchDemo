//
//  ViewController.m
//  3DtouchDemo
//
//  Created by Fidetro on 16/7/26.
//  Copyright © 2016年 Fidetro. All rights reserved.
//

#import "ViewController.h"
#import "DetailController.h"


#define GetViewWidth(view)    view.frame.size.width
#define GetViewHeight(view)   view.frame.size.height
#define GetViewX(view)        view.frame.origin.x
#define GetViewY(view)        view.frame.origin.y
@interface ViewController ()<UIViewControllerPreviewingDelegate>
@property (nonatomic,strong)UIImageView *touchView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.touchView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.touchView.center = self.view.center;
    self.touchView.image = [UIImage imageNamed:@"120-logo"];
    [self.view addSubview:self.touchView];
    
    //判断系统是否大于ios9
   if ([[UIDevice currentDevice].systemVersion floatValue] >= 9) {
       //判断3Dtouch是否可用，可用就注册
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        [self registerForPreviewingWithDelegate:self sourceView:self.view];
    }
     }
}
#pragma mark - 3Dtouch代理事件
- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{
    [self showViewController:viewControllerToCommit sender:self];
}
#pragma mark - 3Dtouch的peek
- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location{
    
    if ([self.presentedViewController isKindOfClass:[DetailController class]])
    {
        return nil;
    }else{
        
        if (![self getShouldShowRectAndIndexPathWithLocation:location withLocationView:self.touchView])
            return nil;
        
        DetailController  *detailVC = [[DetailController alloc]init];
        detailVC.peekView = [[UIImageView alloc]initWithFrame:detailVC.view.frame];
        detailVC.peekView.image = self.touchView.image;
        [detailVC.view addSubview:detailVC.peekView];
        
        return detailVC;
    }
}
#pragma mark - 判断touch范围是不是那里面
- (BOOL)getShouldShowRectAndIndexPathWithLocation:(CGPoint)location withLocationView:(UIView *)targetView{
    return (location.x > GetViewX(targetView) && location.x < ((GetViewX(targetView))+GetViewWidth(targetView))&&location.y > GetViewY(targetView) && location.y < ((GetViewY(targetView))+GetViewHeight(targetView)) );
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
