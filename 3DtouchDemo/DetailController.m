//
//  DetailController.m
//  3DtouchDemo
//
//  Created by Fidetro on 16/7/26.
//  Copyright © 2016年 Fidetro. All rights reserved.
//

#import "DetailController.h"

@interface DetailController ()

@end

@implementation DetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems{
    UIPreviewAction *itemLike = [UIPreviewAction actionWithTitle:@"喜欢" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        DetailController *detailVC = (DetailController *)previewViewController;
        NSLog(@"喜欢");
    }];

    UIPreviewAction *itemGoBack = [UIPreviewAction actionWithTitle:@"返回" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"返回");
    }];
    
    return @[itemLike,itemGoBack];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
