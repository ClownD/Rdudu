//
//  BookCollectionViewCell.m
//  UIAAAAAAAAAAAAAAAAAAAAAAAAAAAA
//
//  Created by dllo on 16/9/23.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "BookCollectionViewCell.h"
#import "TCH_BookCarouselFigure_Model.h"
#import "UIImageView+WebCache.h"
@interface BookCollectionViewCell ()


@property (nonatomic, retain) UIImageView *myImageView;

@end

@implementation BookCollectionViewCell





- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.myImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        
        // 适应比例的方法
        _myImageView.contentMode= 2;
        // 将图片局限在画板之内
        _myImageView.clipsToBounds = YES;
        
        [self.contentView addSubview: _myImageView];
        
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
}



-(void)setModel:(TCH_BookCarouselFigure_Model *)model{
    if (_model != model) {
        _model = model;
    }
    
    NSURL *url = [NSURL URLWithString:model.cover];
    [_myImageView sd_setImageWithURL:url];
    NSLog(@"%@", url);
    
    
    
    
}


@end
