//
//  ScheduleTableViewCell.h
//  BasicAtLang
//
//  Created by Ethan Westering on 5/5/15.
//  Copyright (c) 2015 EthanWestering. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScheduleTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;
@property (weak, nonatomic) IBOutlet UILabel *teachingLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
