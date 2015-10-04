//
//  ISPhotoCollectionViewCell.m
//  is-test
//
//  Created by OLEG KALININ on 04.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import "ISPhotoCollectionViewCell.h"


@interface ISPhotoCollectionViewCell ()

@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@end

@implementation ISPhotoCollectionViewCell

- (void)setPhoto:(UIImage *)photo {
    
    self.imageView.image = photo;
    
}

@end
