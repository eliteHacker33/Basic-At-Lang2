//
//  ViewController.m
//  BasicAtLang
//
//  Created by Ethan Westering on 3/2/15.
//  Copyright (c) 2015 EthanWestering. All rights reserved.
//

#import "ViewController.h"
#import "AboutMissionViewController.h"
#import "ScheduleViewController.h"
#import "SocialMediaViewController.h"
#import "ListenOnlineViewController.h"
#import "PhotosViewController.h"
#import "BlogViewController.h"
#import "MusicViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *aboutMissionImage;
@property (weak, nonatomic) IBOutlet UIImageView *scheduleImage;
@property (weak, nonatomic) IBOutlet UIImageView *socialMediaImage;
@property (weak, nonatomic) IBOutlet UIImageView *listenOnlineImage;
@property (weak, nonatomic) IBOutlet UIImageView *photoImage;
@property (weak, nonatomic) IBOutlet UIImageView *musicImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self instatiateMainButtons];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)userTappedTopLeftOption:(UITapGestureRecognizer *)tapGesture

{
    [UIView animateWithDuration:0.1 animations:^{self.aboutMissionImage.alpha = 0.0;}];
    [UIView animateWithDuration:0.3 animations:^{self.aboutMissionImage.alpha = 1.0;}];
    AboutMissionViewController *aboutMissionViewController = [AboutMissionViewController new];
    [self.navigationController pushViewController:aboutMissionViewController animated:YES];
}



-(void)userTappedMiddleLeftOption:(UITapGestureRecognizer *)tapGesture

{
    [UIView animateWithDuration:0.1 animations:^{self.socialMediaImage.alpha = 0.0;}];
    [UIView animateWithDuration:0.3 animations:^{self.socialMediaImage.alpha = 1.0;}];
    SocialMediaViewController *socialMediaController = [SocialMediaViewController new];
    [self.navigationController pushViewController:socialMediaController animated:YES];
}

-(void)userTappedBottomLeftOption:(UITapGestureRecognizer *)tapGesture

{
    [UIView animateWithDuration:0.1 animations:^{self.photoImage.alpha = 0.0;}];
    [UIView animateWithDuration:0.3 animations:^{self.photoImage.alpha = 1.0;}];
    PhotosViewController *photosViewController = [PhotosViewController new];
    [self.navigationController pushViewController:photosViewController animated:YES];
}

-(void)userTappedTopRightOption:(UITapGestureRecognizer *)tapGesture

{
    [UIView animateWithDuration:0.1 animations:^{self.scheduleImage.alpha = 0.0;}];
    [UIView animateWithDuration:0.3 animations:^{self.scheduleImage.alpha = 1.0;}];
    ScheduleViewController *scheduleViewController = [ScheduleViewController new];
    [self.navigationController pushViewController:scheduleViewController animated:YES];
}

-(void)userTappedMiddleRightOption:(UITapGestureRecognizer *)tapGesture

{
    [UIView animateWithDuration:0.1 animations:^{self.listenOnlineImage.alpha = 0.0;}];
    [UIView animateWithDuration:0.3 animations:^{self.listenOnlineImage.alpha = 1.0;}];
    ListenOnlineViewController *teachingController = [ListenOnlineViewController new];
    [self.navigationController pushViewController:teachingController animated:YES];
}



-(void)userTappedBottomRightOption:(UITapGestureRecognizer *)tapGesture

{
    [UIView animateWithDuration:0.1 animations:^{self.musicImage.alpha = 0.0;}];
    [UIView animateWithDuration:0.3 animations:^{self.musicImage.alpha = 1.0;}];
    MusicViewController *musicViewController = [MusicViewController new];
    [self.navigationController pushViewController:musicViewController animated:YES];
}



-(void)instatiateMainButtons

{
    UITapGestureRecognizer *tapMissionImage = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userTappedTopLeftOption:)];
    
    UITapGestureRecognizer *tapSocialMediaImage = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userTappedMiddleLeftOption:)];
    
    UITapGestureRecognizer *tapPhotoImage = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userTappedBottomLeftOption:)];
    
    UITapGestureRecognizer *tapScheduleImage = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userTappedTopRightOption:)];
    
    UITapGestureRecognizer *tapTeachingsImage = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userTappedMiddleRightOption:)];
    
    UITapGestureRecognizer *tapMusicImage = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userTappedBottomRightOption:)];
    
    [self.aboutMissionImage setUserInteractionEnabled:YES];
    
    [self.scheduleImage setUserInteractionEnabled:YES];
    
    [self.socialMediaImage setUserInteractionEnabled:YES];
    
    [self.listenOnlineImage setUserInteractionEnabled:YES];
    
    [self.photoImage setUserInteractionEnabled:YES];
    
    [self.musicImage setUserInteractionEnabled:YES];
    
    [self.aboutMissionImage addGestureRecognizer:tapMissionImage];
    
    [self.socialMediaImage addGestureRecognizer:tapSocialMediaImage];
    
    [self.photoImage addGestureRecognizer:tapPhotoImage];
    
    [self.scheduleImage addGestureRecognizer:tapScheduleImage];
    
    [self.listenOnlineImage addGestureRecognizer:tapTeachingsImage];
    
    [self.musicImage addGestureRecognizer:tapMusicImage];
    
    CALayer *topLeftLayer = [self.aboutMissionImage layer];
    
    [topLeftLayer setMasksToBounds:YES];
    
    [topLeftLayer setCornerRadius:10.0];
    
    CALayer *middleLeftLayer = [self.socialMediaImage layer];
    
    [middleLeftLayer setMasksToBounds:YES];
    
    [middleLeftLayer setCornerRadius:50.0];
    
    CALayer *bottomLeftLayer = [self.photoImage layer];
    
    [bottomLeftLayer setMasksToBounds:YES];
    
    [bottomLeftLayer setCornerRadius:50.0];
    
    CALayer *topRightLayer = [self.scheduleImage layer];
    
    [topRightLayer setMasksToBounds:YES];
    
    [topRightLayer setCornerRadius:50.0];
    
    CALayer *middleRightLayer = [self.listenOnlineImage layer];
    
    [middleRightLayer setMasksToBounds:YES];
    
    [middleRightLayer setCornerRadius:50.0];
    
    CALayer *bottomRightLayer = [self.musicImage layer];
    
    [bottomRightLayer setMasksToBounds:YES];
    
    [bottomRightLayer setCornerRadius:50.0];
    
}


@end
