//
//  HomeViewController.m
//  UIAAAAAAAAAAAAAAAAAAAAAAAAAAAA
//
//  Created by dllo on 16/9/20.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "HomeViewController.h"
#import "IDViewController.h"
#import "HomeCollectionViewCell.h"
#import "LJNetTool.h"
#import "AFNetworking.h"
#import "Home.h"
static NSString *const cellIdentifier = @"cell";
static NSString *const header = @"header";
static NSString *const footer = @"footer";
@interface HomeViewController ()
<
UICollectionViewDataSource,
UICollectionViewDelegate
>
@property (nonatomic , retain) UIImage *image;
@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.array = [NSMutableArray array];

    self.view.backgroundColor = [UIColor whiteColor];
    [self JXSJ];
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
    //flowlayout.itemSize = CGSizeMake(120, 180);
    flowlayout.itemSize = self.view.bounds.size;
    flowlayout.minimumLineSpacing = 0;
    flowlayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowlayout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.pagingEnabled = YES;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [_collectionView registerClass:[HomeCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_collectionView];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return _array.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //从重用池
    HomeCollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
   // cell.image = [UIImage imageNamed:@"1.jpg"];
    
    Home *cellModel = [_array objectAtIndex:indexPath.row];
    cell.home = cellModel;
    
    
    return cell;
    
}

- (void)JXSJ {

    NSString *string = @"http://v3.wufazhuce.com:8000/api/hp/more/0";
    [LJNetTool GET:string body:nil headerField:nil response: LJJSON success:^(id result) {
        NSDictionary *homeDic = (NSDictionary *) result;
        NSArray *homeArray = [homeDic objectForKey:@"data"];
        for (NSDictionary *AhomeDic in homeArray) {
            Home *homeModel = [[Home alloc] initWithDic:AhomeDic];
            [_array addObject:homeModel];
            
            
        }
        [_collectionView reloadData];
    } failure:^(NSError *error) {
        
    }];
    
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
