//
//  FlimTableViewCell.m
//  UIAAAAAAAAAAAAAAAAAAAAAAAAAAAA
//
//  Created by M on 16/9/22.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "FlimTableViewCell.h"
#import "Flim.h"
#import "UIImageView+WebCache.h"

#define WIDTH self.bounds.size.width
#define HEIGHT self.bounds.size.height

@interface FlimTableViewCell ()

//@property(nonatomic, retain)UIImageView *imageName;

/** 举例 */
@property(nonatomic, retain)UILabel *label;
@property (nonatomic, retain) UIImageView *flimImageView;
@end

@implementation FlimTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        /** 这是图片的 */
        self.imageName = [[UIImageView alloc] init];
        [self.contentView addSubview:_imageName];
        
        /**  */
        self.label = [[UILabel alloc] init];
        [self.contentView addSubview:_label];
        self.flimImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_flimImageView];
    }
    return self;
}

- (void)setFlim:(Flim *)flim {
    if (_flim != flim) {
        _flim = flim;
    }
    NSURL *url = [NSURL URLWithString:flim.cover];
    [_flimImageView sd_setImageWithURL:url];
    NSLog(@"%@",url);
}




-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageName.frame = self.bounds;
    self.imageName.backgroundColor = [UIColor colorWithRed:arc4random()%255 / 255.0 green:arc4random()%255 / 255.0  blue:arc4random()%255 / 255.0  alpha:1];
    
    self.label.frame = CGRectMake(0, 0, WIDTH * 0.1, HEIGHT * 0.2);
    self.label.text = @"001";
    self.flimImageView.frame = self.bounds;
    
    
        
    
}


@end
