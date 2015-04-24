//
//  ScheduleViewController.m
//  BasicAtLang
//
//  Created by Ethan Westering on 3/2/15.
//  Copyright (c) 2015 EthanWestering. All rights reserved.
//

#import "ScheduleViewController.h"

@interface ScheduleViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageAttempt1;
@property (weak, nonatomic) IBOutlet UIImageView *imageAttempt2;
@property (weak, nonatomic) IBOutlet UIImageView *imageAttempt3;

@end

@implementation ScheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Schedule";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
