//
//  ScheduleViewController.m
//  BasicAtLang
//
//  Created by Ethan Westering on 3/2/15.
//  Copyright (c) 2015 EthanWestering. All rights reserved.
//

#import "ScheduleViewController.h"

@interface ScheduleViewController ()


@end

@implementation ScheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Schedule";
    [self csvParser];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)csvParser{

    NSString *pathName = [NSString stringWithFormat:@"/Users/ethanwestering/LayerOfAbstraction/Undergrad Research/myUserAccounts.csv"];
    NSString *finalRespStr = [NSString stringWithContentsOfFile:pathName encoding:NSStringEncodingConversionAllowLossy error:nil];

    NSArray *array = [finalRespStr componentsSeparatedByString:@"\n"];
    NSMutableString *mutableBothEnabled = [NSMutableString new];
    NSMutableString *mutableHasShellAccess = [NSMutableString new];
    NSMutableString *mutableHasRDPAccess = [NSMutableString new];
    NSMutableString *mutableHasNeither = [NSMutableString new];
    
    for (NSString *brokenUp in array){
        NSArray *arrayStrr = [brokenUp componentsSeparatedByString:@","];
        if ([arrayStrr[0]  isEqual: @""]) {
//            NSLog(@"%lu", (unsigned long)[array count]);
            break;
        }
        if (([arrayStrr[4] integerValue] == 1) && ([arrayStrr[5]integerValue] == 1)) {
            [mutableBothEnabled appendString:[NSString stringWithFormat:@"%@\n",brokenUp]];
        }
        else if([arrayStrr[4]integerValue] == 1){
            [mutableHasShellAccess appendString:[NSString stringWithFormat:@"%@\n",brokenUp]];
        }
        else if([arrayStrr[5]integerValue] == 1 ){
            [mutableHasRDPAccess appendString:[NSString stringWithFormat:@"%@\n",brokenUp]];
        }
        else{
            [mutableHasNeither appendString:[NSString stringWithFormat:@"%@\n", brokenUp]];
        }
        [mutableBothEnabled writeToFile:@"Users/ethanwestering/bothEnabled.csv" atomically:YES encoding:NSStringEncodingConversionAllowLossy error:nil];
        [mutableHasShellAccess writeToFile:@"Users/ethanwestering/shellAccessEnabled.csv" atomically:YES encoding:NSStringEncodingConversionAllowLossy error:nil];
        [mutableHasRDPAccess writeToFile:@"Users/ethanwestering/rdpAccessonly.csv" atomically:YES encoding:NSStringEncodingConversionAllowLossy error:nil];
        [mutableHasNeither writeToFile:@"Users/ethanwestering/neitherEnabled.csv" atomically:YES encoding:NSStringEncodingConversionAllowLossy error:nil];
}
    
//    NSLog(@"%@\n%@\n%@", arrayStrr[0], arrayStrr[1],arrayStrr[2]);
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
