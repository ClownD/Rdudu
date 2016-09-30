//
//  IDAndBackViewController.m
//  UIAAAAAAAAAAAAAAAAAAAAAAAAAAAA
//
//  Created by dllo on 16/9/21.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "IDAndBackViewController.h"
#import "IDViewController.h"
@interface IDAndBackViewController ()

@end

@implementation IDAndBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *idImage = [UIImage imageNamed:@"id2.png"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:idImage style:UIBarButtonItemStylePlain target:self action:@selector(idButtonAction:)];

    UIImage *searchImage = [UIImage imageNamed:@"s"];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:searchImage style:UIBarButtonItemStylePlain target:self action:@selector(searchButtonAction:)];
    
    
    
    
    
}
- (void)idButtonAction:(UIButton *)buton {
    IDViewController *idVC = [[IDViewController alloc] init];
    idVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:idVC animated:YES];
}

- (void)searchButtonAction:(UIButton *)buton {

    
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
