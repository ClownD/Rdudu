//
//  BookCollectionViewCell.h
//  UIAAAAAAAAAAAAAAAAAAAAAAAAAAAA
//
//  Created by dllo on 16/9/23.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TCH_BookCarouselFigure_Model;
@interface BookCollectionViewCell : UICollectionViewCell
@property (nonatomic, retain) UIImage *image;


@property(nonatomic, retain)TCH_BookCarouselFigure_Model *model;
@end
