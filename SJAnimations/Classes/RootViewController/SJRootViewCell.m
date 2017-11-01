//
//  SJRootViewCell.m
//  SJAnimations
//
//  Created by shejun.zhou on 16/1/16.
//  Copyright © 2016年 shejun.zhou. All rights reserved.
//

#import "SJRootViewCell.h"
#import "SJItem.h"
#import "POP.h"
#import "UIFont+SJFonts.h"

@implementation SJRootViewCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - 

- (void)loadContentWithData:(SJItem *)item indexPath:(NSIndexPath *)indexPath {
    if (item) {
        self.textLabel.text = [NSString stringWithFormat:@"%@", item.name];
        self.textLabel.font = [UIFont HeitiSCWithFontSize:20.f];
        self.textLabel.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.65f];
        self.textLabel.backgroundColor = [UIColor clearColor];

        self.detailTextLabel.text = [NSString stringWithFormat:@"%@", item.object];
        self.detailTextLabel.font = [UIFont AvenirLightWithFontSize:8.f];
        self.detailTextLabel.textColor = [UIColor grayColor];
        self.detailTextLabel.backgroundColor = [UIColor clearColor];
        
        if (indexPath.row % 2) {
            self.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.05f];
        } else {
            self.backgroundColor = [UIColor whiteColor];
        }
    }
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:YES];
    if (self.highlighted) {
        
        POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scaleAnimation.duration           = 0.1f;
        scaleAnimation.toValue            = [NSValue valueWithCGPoint:CGPointMake(0.95, 0.95)];
        [self.textLabel pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
        
    } else {
        
        POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scaleAnimation.toValue             = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
        scaleAnimation.velocity            = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
        scaleAnimation.springBounciness    = 20.f;
        [self.textLabel pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    }

}

@end
