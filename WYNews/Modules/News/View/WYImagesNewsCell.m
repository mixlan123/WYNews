//
//  WYImageNewsCell.m
//  WYNews
//
//  Created by dai.fengyi on 15/6/9.
//  Copyright (c) 2015年 childrenOurFuture. All rights reserved.
//

#import "WYImagesNewsCell.h"
@interface WYImagesNewsCell()
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *singleImageView;
@property (weak, nonatomic) IBOutlet UIImageView *secondImageView;
@property (weak, nonatomic) IBOutlet UIImageView *thirdImageView;
@property (weak, nonatomic) IBOutlet UILabel *votecount;
@end
@implementation WYImagesNewsCell
+ (id)cell
{
    
    return [[[NSBundle mainBundle] loadNibNamed:@"ImagesNews" owner:nil options:nil] lastObject];
}

- (void)setNews:(WYNews *)news
{
    [super setNews:news];
    [_singleImageView sd_setImageWithURL:[NSURL URLWithString:self.news.imgsrc] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageLowPriority | SDWebImageRetryFailed completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
    [_secondImageView sd_setImageWithURL:[NSURL URLWithString:self.news.imgextra[0][@"imgsrc"]] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageLowPriority | SDWebImageRetryFailed];
    [_thirdImageView sd_setImageWithURL:[NSURL URLWithString:self.news.imgextra[1][@"imgsrc"]] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageLowPriority | SDWebImageRetryFailed];
    _title.text = self.news.title;
    _votecount.text = [NSString stringWithFormat:@"%d跟帖", self.news.votecount];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end