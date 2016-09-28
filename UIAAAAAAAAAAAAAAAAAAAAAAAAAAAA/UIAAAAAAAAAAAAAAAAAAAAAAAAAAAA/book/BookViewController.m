//
//  BookViewController.m
//  UIAAAAAAAAAAAAAAAAAAAAAAAAAAAA
//
//  Created by dllo on 16/9/20.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "BookViewController.h"
#import "IDViewController.h"
#import "BookCollectionViewCell.h"
#import "LJNetTool.h"
#import "TCH_BookCarouselFigure_Model.h"
#import "BookTextViewCell.h"
static NSString *const cellIdentifier = @"cell";
@interface BookViewController ()
<
UICollectionViewDataSource,
UICollectionViewDelegate
>
@property (nonatomic , retain) UIImage *image;
@property(nonatomic, retain)NSMutableArray *Array;
@property(nonatomic, retain)NSMutableArray *mArray;
@property(nonatomic, retain)UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionView *bookCollectionView;
@end

@implementation BookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mArray = [NSMutableArray array];
   
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(0, 64, self.view.frame.size.width, 160);
   
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(self.view.frame.size.width, view.frame.size.height);
    flowLayout.minimumLineSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:view.bounds collectionViewLayout:flowLayout];
    collectionView.pagingEnabled = YES;
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.showsHorizontalScrollIndicator = NO;
    [collectionView registerClass:[BookCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    [view addSubview:collectionView];
    [self.view addSubview:view];
    
    self.collectionView = collectionView;
    
    [self Hand];
    
    
    UIScrollView *bookScrollView = [[UIScrollView alloc] init];
    bookScrollView.frame = CGRectMake(0, 244, self.view.frame.size.width, self.view.frame.size.height);
    bookScrollView.contentSize = CGSizeMake(self.view.frame.size.width , 200);
    bookScrollView.backgroundColor = [UIColor colorWithRed:arc4random()%255 / 255.0 green:arc4random()%255 / 255.0  blue:arc4random()%255 / 255.0  alpha:1];
    [self.view addSubview:bookScrollView];
    UICollectionViewFlowLayout *bookCVFL = [[UICollectionViewFlowLayout alloc] init];
    bookCVFL.itemSize = bookScrollView.bounds.size;
    bookCVFL.minimumLineSpacing = 0;
    bookCVFL.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.bookCollectionView = [[UICollectionView alloc] initWithFrame:bookScrollView.bounds collectionViewLayout:bookCVFL];
    _bookCollectionView.backgroundColor = [UIColor yellowColor];
    _bookCollectionView.pagingEnabled = YES;
    _bookCollectionView.dataSource = self;
    _bookCollectionView.delegate = self;
    [_bookCollectionView registerClass:[BookCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    _bookCollectionView.showsHorizontalScrollIndicator = NO;
    _bookCollectionView.showsVerticalScrollIndicator = NO;
    [bookScrollView addSubview:_bookCollectionView];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    
    imageView.image = [UIImage imageNamed:@"1"];
    
    [_bookCollectionView addSubview:imageView];
}


- (void)JXSJ {

    NSString *string = @"http://v3.wufazhuce.com:8000/api/reading/index?version=v3.5&platform=ios&user_id=7301429";
    [LJNetTool GET:string body:nil headerField:nil response:LJJSON success:^(id result) {
        NSDictionary *bookDic = (NSDictionary *)result;
        NSArray *bookArray = [bookDic objectForKey:@"data"];
        for (NSDictionary *AbookDic in bookArray) {
            TCH_BookCarouselFigure_Model *bookModel = [[TCH_BookCarouselFigure_Model alloc] initWithDic:AbookDic];
            [_Array addObject:bookModel];
        }
    } failure:^(NSError *error) {
        
    }];

}








-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.mArray.count;
}
// 是指collcetionViewCell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //从重用池
    BookCollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%256 / 255.f green:arc4random()%256 / 255.f blue:arc4random()%256 / 255.f alpha:1.0];
//    cell.image = [UIImage imageNamed:@"o2"];
    TCH_BookCarouselFigure_Model *modelPicture = [self.mArray objectAtIndex:indexPath.row];
    cell.model = modelPicture;
    NSLog(@"%@", modelPicture.cover);
    return cell;
    
}


-(void)Hand{
    [LJNetTool GET:@"http://v3.wufazhuce.com:8000/api/reading/carousel/" body:nil headerField:nil response:LJJSON success:^(id result) {
        
        NSArray *dicResult = [result objectForKey:@"data"];
        for (NSDictionary *dic in dicResult) {
            TCH_BookCarouselFigure_Model *tchModel = [[TCH_BookCarouselFigure_Model alloc] initWithDic:dic];
            [self.mArray addObject:tchModel];
        }
        [self.collectionView reloadData];
        
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

