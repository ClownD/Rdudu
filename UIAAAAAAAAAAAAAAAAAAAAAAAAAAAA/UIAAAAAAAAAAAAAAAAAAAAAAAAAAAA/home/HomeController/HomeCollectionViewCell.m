//
//  HomeCollectionViewCell.m
//  UIAAAAAAAAAAAAAAAAAAAAAAAAAAAA
//
//  Created by dllo on 16/9/21.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "HomeCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "Home.h"
@interface HomeCollectionViewCell ()


@property (nonatomic, retain) UIImageView *myImageView;

@property (nonatomic, strong) UIImageView *homeImageView ;
@property (nonatomic, strong) UIImageView *lakeImageView;
@property (nonatomic, strong) UIImageView *noteImageView;
@property (nonatomic, strong) UIImageView *shareImageView;
@property (nonatomic, strong) UILabel *homeLabel;
@end

@implementation HomeCollectionViewCell





- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.myImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        // 适应比例的方法
        _myImageView.contentMode= 2;
        // 将图片局限在画板之内
        _myImageView.clipsToBounds = YES;
        [self.contentView addSubview: _myImageView];

        self.homeImageView = [[UIImageView alloc] init];
        self.lakeImageView = [[UIImageView alloc] init];
        self.homeLabel = [[UILabel alloc] init];
        // 自适应
        _homeLabel.numberOfLines = 0;
        [self.contentView addSubview:_homeImageView];
        [self.contentView addSubview:_lakeImageView];
        [self.contentView addSubview:_homeLabel];
        
    }
    return self;
    
}
- (void)setImage:(UIImage *)image {
    if (_image != image) {
        _myImageView.image = image;
    }
}


- (void)layoutSubviews {
    [super layoutSubviews];
    _myImageView.frame = self.contentView.bounds;
    _homeImageView.frame = CGRectMake(20, 60,self.contentView.frame.size.width - 40 , (self.contentView.frame.size.width - 20) / 1.35);
    _homeLabel.frame = CGRectMake(_homeImageView.frame.origin.x, _homeImageView.frame.origin.y + _homeImageView.frame.size.height + 10 , _homeImageView.frame.size.width,0 );
    [_homeLabel sizeToFit ];
    
}

- (void)setHome:(Home *)home {
    if (_home != home) {
        _home = home;
    }
    
    NSURL *url = [NSURL URLWithString:home.hp_img_url];
    [_homeImageView sd_setImageWithURL:url];
    _homeLabel.text = home.hp_content;
}


@end
