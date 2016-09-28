//
//  MusicViewController.m
//  UIAAAAAAAAAAAAAAAAAAAAAAAAAAAA
//
//  Created by dllo on 16/9/20.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "MusicViewController.h"

@interface MusicViewController ()

@end

@implementation MusicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    UIScrollView *musicScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    musicScrollView.contentSize = CGSizeMake(musicScrollView.bounds.size.width * 2, musicScrollView.bounds.size.height * 2);
    musicScrollView.backgroundColor = [UIColor orangeColor];
    musicScrollView.pagingEnabled = YES;
    musicScrollView.directionalLockEnabled = YES;
    musicScrollView.showsHorizontalScrollIndicator = NO;
    musicScrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    [self.view addSubview:musicScrollView];
    
    
    UIImageView *musicImageView = [[UIImageView alloc] init];
    musicImageView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    musicImageView.image = [UIImage imageNamed:@"o2"];
    [musicScrollView addSubview:musicImageView];
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
