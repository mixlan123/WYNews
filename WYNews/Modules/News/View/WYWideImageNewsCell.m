//
//  WYWideImageNewsCell.m
//  WYNews
//
//  Created by dai.fengyi on 15/6/9.
//  Copyright (c) 2015年 childrenOurFuture. All rights reserved.
//

#import "WYWideImageNewsCell.h"
@interface WYWideImageNewsCell()
{
    __weak IBOutlet UILabel *_digest;
}
@end
@implementation WYWideImageNewsCell
+ (id)cell
{
    return [[[NSBundle mainBundle] loadNibNamed:@"WideImageNews" owner:nil options:nil] lastObject];
}

- (void)setNews:(WYNews *)news
{
    [super setNews:news];
    [_singleImageView sd_setImageWithURL:[NSURL URLWithString:self.news.imgsrc] placeholderImage:[UIImage imageNamed:@"contentview_image_default"] options:SDWebImageLowPriority | SDWebImageRetryFailed completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
    _title.text = self.news.title;
    _digest.text = self.news.digest;
//    _votecount.text = [NSString stringWithFormat:@"%d跟帖", self.news.votecount];
    [_votecount setTitle:[NSString stringWithFormat:@"%d跟帖", self.news.votecount] forState:UIControlStateDisabled];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
