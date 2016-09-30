//
//  TCH_Film_ViewController.m
//  UIAAAAAAAAAAAAAAAAAAAAAAAAAAAA
//
//  Created by M on 16/9/26.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "TCH_Film_ViewController.h"

@interface TCH_Film_ViewController ()

@end

@implementation TCH_Film_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%255 / 255.0 green:arc4random()%255 / 255.0  blue:arc4random()%255 / 255.0  alpha:1];
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
    label.text = self.str;
    [self.view addSubview:label];
    
    
    UIWebView* webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    //webView.scalesPageToFit = YES; 限制网页在屏幕尺寸
    [self.view addSubview:webView];
    NSString *string = [NSString stringWithFormat:@"http://m.wufazhuce.com/movie/%@", _id];
    NSURL* url = [NSURL URLWithString:string];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
    

    
    
    
    
    
    
    
    
    
    
    
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
