//
//  IDViewController.m
//  UIAAAAAAAAAAAAAAAAAAAAAAAAAAAA
//
//  Created by dllo on 16/9/21.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "IDViewController.h"
#import "HomeViewController.h"

@interface IDViewController ()

@end

@implementation IDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIScrollView *IDScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    IDScrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:IDScrollView];
    IDScrollView.contentSize = CGSizeMake(IDScrollView.bounds.size.width, IDScrollView.bounds.size.height + 100);
    IDScrollView.showsVerticalScrollIndicator = NO;
    
    UIImageView *IDImeageView = [[UIImageView alloc] init];
    IDImeageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height / 2);
    IDImeageView.backgroundColor = [UIColor yellowColor];
    [IDScrollView addSubview:IDImeageView];
    IDImeageView.image = [UIImage imageNamed:@"o1.jpg"];
    
    UIButton *homeButton = [[UIButton alloc] init];
    homeButton.frame = CGRectMake(10, 15, 50, 50);
    [homeButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [homeButton addTarget:self action:@selector(idButtonAction:)
         forControlEvents:UIControlEventTouchUpInside];  
    [IDScrollView addSubview:homeButton];
    
}






- (void)idButtonAction:(UIButton *)buton {
//    HomeViewController *HVC = [[HomeViewController alloc] init];
//    HVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//    
//    [self presentModalViewController:HVC animated:YES];
    [self dismissModalViewControllerAnimated:YES];
    
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
