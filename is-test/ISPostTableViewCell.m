//
//  ISPostTableViewCell.m
//  is-test
//
//  Created by OLEG KALININ on 04.10.15.
//  Copyright © 2015 OLEG KALININ. All rights reserved.
//

#import "ISPostTableViewCell.h"

@interface ISPostTableViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *labelTitle;
@property (nonatomic, weak) IBOutlet UILabel *labelBody;

@end

@implementation ISPostTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTitle:(NSString *)title {
    _title = title;
    _labelTitle.text = title;
}

- (void)setBody:(NSString *)body {
    _body = body;
    _labelBody.text = body;
}

@end
