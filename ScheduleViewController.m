//
//  ScheduleViewController.m
//  BasicAtLang
//
//  Created by Ethan Westering on 3/2/15.
//  Copyright (c) 2015 EthanWestering. All rights reserved.
//

#import "ScheduleViewController.h"
#import "ScheduleTableViewCell.h"

@interface ScheduleViewController ()

@property (nonatomic, strong)NSMutableArray *dateArray;
@property (nonatomic, strong)NSMutableArray *teachingSeriesArray;
@property (nonatomic, strong)NSMutableArray *placeArray;
@property (nonatomic, strong)NSMutableArray *timeArray;

@end

@implementation ScheduleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Schedule";
    [self.scheduleTableView reloadData];
    [self csvParser];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)csvParser{

    NSString *pathName = [NSString stringWithFormat:@"/Users/ethanwestering/LayerOfAbstraction/Undergrad Research/basicSchedule.csv"];
    NSString *finalRespStr = [NSString stringWithContentsOfFile:pathName encoding:NSStringEncodingConversionAllowLossy error:nil];

    self.dateArray = [NSMutableArray new];
    self.teachingSeriesArray = [NSMutableArray new];
    self.placeArray = [NSMutableArray new];
    self.timeArray = [NSMutableArray new];
    
    
    NSArray *array = [finalRespStr componentsSeparatedByString:@"\n"];
    
    for (NSString *brokenUp in array){
        NSArray *arrayStrr = [brokenUp componentsSeparatedByString:@","];
        if ([arrayStrr count] > 2) {
            [self.dateArray addObject:arrayStrr[0]];
            [self.teachingSeriesArray addObject:arrayStrr[1]];
            [self.placeArray addObject:arrayStrr[2]];
            [self.timeArray addObject:arrayStrr[3]];
        }
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ScheduleTableViewCell *stvc = [tableView dequeueReusableCellWithIdentifier:@"scheduleCell" forIndexPath:indexPath];
    if (stvc == nil) {
        stvc = [[ScheduleTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ScheduleTableViewCell"];
    }
    
    NSArray *colorArray = @[[UIColor whiteColor],[UIColor redColor],[UIColor orangeColor],[UIColor yellowColor],[UIColor greenColor],[UIColor grayColor], [UIColor blueColor], [UIColor blackColor], [UIColor purpleColor]];
    int r = arc4random_uniform(9);
    if (colorArray[r] == [UIColor blueColor] || colorArray[r] == [UIColor blackColor] || colorArray[r] == [UIColor purpleColor]){
        stvc.dateLabel.textColor = [UIColor whiteColor];
        stvc.placeLabel.textColor = [UIColor whiteColor];
        stvc.timeLabel.textColor = [UIColor whiteColor];
        stvc.teachingLabel.textColor = [UIColor whiteColor];
    }
    else{
        stvc.dateLabel.textColor = [UIColor blackColor];
        stvc.placeLabel.textColor = [UIColor blackColor];
        stvc.timeLabel.textColor = [UIColor blackColor];
        stvc.teachingLabel.textColor = [UIColor blackColor];
    }
    
    stvc.backgroundColor = colorArray[r];
    stvc.dateLabel.text = [self.dateArray objectAtIndex:indexPath.row];
    stvc.placeLabel.text = [self.placeArray objectAtIndex:indexPath.item];
    stvc.timeLabel.text = [self.timeArray objectAtIndex:indexPath.item];
    stvc.teachingLabel.text = [self.teachingSeriesArray objectAtIndex:indexPath.item];
    
    return stvc;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dateArray count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

@end
