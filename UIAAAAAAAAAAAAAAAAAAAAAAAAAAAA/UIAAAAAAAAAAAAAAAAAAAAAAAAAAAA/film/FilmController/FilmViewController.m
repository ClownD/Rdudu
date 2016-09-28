//
//  FilmViewController.m
//  UIAAAAAAAAAAAAAAAAAAAAAAAAAAAA
//
//  Created by dllo on 16/9/20.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "FilmViewController.h"
#import "FlimTableViewCell.h"
#import "LJNetTool.h"
#import "AFNetworking.h"
#import "Flim.h"

#import "TCH_Film_ViewController.h"

static NSString *const cellIdentifier = @"cell";

@interface FilmViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic , retain) UIImage *image;
@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, strong) UICollectionView *collectionView;
@property(nonatomic, retain)UITableView *tableView;

@end

@implementation FilmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self JXSJ];
    self.array = [NSMutableArray array];
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    /** 加这句或者 在下面那句 */
//    self.tableView.rowHeight = 150;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    [self.tableView registerClass:[FlimTableViewCell class] forCellReuseIdentifier:@"cell"];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
      return _array.count;
}


/** 或者这样 */
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FlimTableViewCell *cell  =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    
    
    Flim *cellModel = [_array objectAtIndex:indexPath.row];
    cell.flim = cellModel;
    return cell;
    
}

- (void)JXSJ {
    NSString *string = @"http://v3.wufazhuce.com:8000/api/movie/list/0";
    [LJNetTool GET:string body:nil headerField:nil response: LJJSON success:^(id result) {
        NSDictionary *flimDic = (NSDictionary *) result;
        NSArray *homeArray = [flimDic objectForKey:@"data"];
        for (NSDictionary *AhomeDic in homeArray) {
            Flim *flimModel = [[Flim alloc] initWithDic:AhomeDic];
            [_array addObject:flimModel];
               NSLog(@"%ld",_array.count);
        }
    [_tableView reloadData];
    } failure:^(NSError *error) {
    }];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TCH_Film_ViewController *vc = [[TCH_Film_ViewController alloc] init];
    vc.str = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
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
