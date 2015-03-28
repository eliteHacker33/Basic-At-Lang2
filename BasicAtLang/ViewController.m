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
#import "GetInvolvedViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *aboutMissionImage;
@property (weak, nonatomic) IBOutlet UIImageView *scheduleImage;
@property (weak, nonatomic) IBOutlet UIImageView *socialMediaImage;
@property (weak, nonatomic) IBOutlet UIImageView *listenOnlineImage;
@property (weak, nonatomic) IBOutlet UIImageView *photoImage;
@property (weak, nonatomic) IBOutlet UIImageView *musicImage;
@property (weak, nonatomic) IBOutlet UIImageView *blogImage;
@property (weak, nonatomic) IBOutlet UIImageView *getInvolvedImage;


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

-(void)userTappedAboutMissionOption:(UITapGestureRecognizer *)tapGesture

{
    [UIView animateWithDuration:0.1 animations:^{self.aboutMissionImage.alpha = 0.0;}];
    [UIView animateWithDuration:0.3 animations:^{self.aboutMissionImage.alpha = 1.0;}];
    AboutMissionViewController *aboutMissionViewController = [AboutMissionViewController new];
    [self.navigationController pushViewController:aboutMissionViewController animated:YES];
}



-(void)userTappedSocialMediaOption:(UITapGestureRecognizer *)tapGesture

{
    [UIView animateWithDuration:0.1 animations:^{self.socialMediaImage.alpha = 0.0;}];
    [UIView animateWithDuration:0.3 animations:^{self.socialMediaImage.alpha = 1.0;}];
    SocialMediaViewController *socialMediaController = [SocialMediaViewController new];
    [self.navigationController pushViewController:socialMediaController animated:YES];
}

-(void)userTappedPhotoOption:(UITapGestureRecognizer *)tapGesture

{
    [UIView animateWithDuration:0.1 animations:^{self.photoImage.alpha = 0.0;}];
    [UIView animateWithDuration:0.3 animations:^{self.photoImage.alpha = 1.0;}];
    PhotosViewController *photosViewController = [PhotosViewController new];
    [self.navigationController pushViewController:photosViewController animated:YES];
}

-(void)userTappedScheduleOption:(UITapGestureRecognizer *)tapGesture

{
    [UIView animateWithDuration:0.1 animations:^{self.scheduleImage.alpha = 0.0;}];
    [UIView animateWithDuration:0.3 animations:^{self.scheduleImage.alpha = 1.0;}];
    ScheduleViewController *scheduleViewController = [ScheduleViewController new];
    [self.navigationController pushViewController:scheduleViewController animated:YES];
}

-(void)userTappedListenOnlineOption:(UITapGestureRecognizer *)tapGesture

{
    [UIView animateWithDuration:0.1 animations:^{self.listenOnlineImage.alpha = 0.0;}];
    [UIView animateWithDuration:0.3 animations:^{self.listenOnlineImage.alpha = 1.0;}];
    ListenOnlineViewController *teachingController = [ListenOnlineViewController new];
    [self.navigationController pushViewController:teachingController animated:YES];
}

-(void)userTappedMusicOption:(UITapGestureRecognizer *)tapGesture

{
    [UIView animateWithDuration:0.1 animations:^{self.musicImage.alpha = 0.0;}];
    [UIView animateWithDuration:0.3 animations:^{self.musicImage.alpha = 1.0;}];
    MusicViewController *musicViewController = [MusicViewController new];
    [self.navigationController pushViewController:musicViewController animated:YES];
}

-(void)userTappedBlogImage: (UITapGestureRecognizer *)tapGesture{
    [UIView animateWithDuration:0.1 animations:^{self.blogImage.alpha = 0.0;}];
    [UIView animateWithDuration:0.3 animations:^{self.blogImage.alpha = 1.0;}];
    BlogViewController *blogViewController = [BlogViewController new];
    [self.navigationController pushViewController:blogViewController animated:YES];
}

-(void)userTappedGetInvolvedImage: (UITapGestureRecognizer *)tapGesture{
    [UIView animateWithDuration:0.1 animations:^{self.getInvolvedImage.alpha = 0.0;}];
    [UIView animateWithDuration:0.3 animations:^{self.getInvolvedImage.alpha = 1.0;}];
    GetInvolvedViewController *getInvolvedViewController = [GetInvolvedViewController new];
    [self.navigationController pushViewController:getInvolvedViewController animated:YES];
}

-(void)instatiateMainButtons

{
    self.aboutMissionImage.translatesAutoresizingMaskIntoConstraints = NO;
    self.scheduleImage.translatesAutoresizingMaskIntoConstraints = NO;
    self.socialMediaImage.translatesAutoresizingMaskIntoConstraints = NO;
    self.listenOnlineImage.translatesAutoresizingMaskIntoConstraints = NO;
    self.photoImage.translatesAutoresizingMaskIntoConstraints = NO;
    self.musicImage.translatesAutoresizingMaskIntoConstraints = NO;
    self.blogImage.translatesAutoresizingMaskIntoConstraints = NO;
    self.getInvolvedImage.translatesAutoresizingMaskIntoConstraints = NO;
    
    UITapGestureRecognizer *tapMissionImage = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userTappedAboutMissionOption:)];
    
    UITapGestureRecognizer *tapSocialMediaImage = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userTappedSocialMediaOption:)];
    
    UITapGestureRecognizer *tapPhotoImage = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userTappedPhotoOption:)];
    
    UITapGestureRecognizer *tapScheduleImage = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userTappedScheduleOption:)];
    
    UITapGestureRecognizer *tapTeachingsImage = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userTappedListenOnlineOption:)];
    
    UITapGestureRecognizer *tapMusicImage = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userTappedMusicOption:)];
    
    UITapGestureRecognizer *tapBlogImage = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userTappedBlogImage:)];
    
    UITapGestureRecognizer *tapGetInvolvedImage = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userTappedGetInvolvedImage:)];
    
    [self.aboutMissionImage setUserInteractionEnabled:YES];
    [self.scheduleImage setUserInteractionEnabled:YES];
    [self.socialMediaImage setUserInteractionEnabled:YES];
    [self.listenOnlineImage setUserInteractionEnabled:YES];
    [self.photoImage setUserInteractionEnabled:YES];
    [self.musicImage setUserInteractionEnabled:YES];
    [self.blogImage setUserInteractionEnabled:YES];
    [self.getInvolvedImage setUserInteractionEnabled:YES];
    
    [self.aboutMissionImage addGestureRecognizer:tapMissionImage];
    [self.socialMediaImage addGestureRecognizer:tapSocialMediaImage];
    [self.photoImage addGestureRecognizer:tapPhotoImage];
    [self.scheduleImage addGestureRecognizer:tapScheduleImage];
    [self.listenOnlineImage addGestureRecognizer:tapTeachingsImage];
    [self.musicImage addGestureRecognizer:tapMusicImage];
    [self.blogImage addGestureRecognizer:tapBlogImage];
    [self.getInvolvedImage addGestureRecognizer:tapGetInvolvedImage];
    
    CALayer *aboutMissionLayer = [self.aboutMissionImage layer];
    [aboutMissionLayer setMasksToBounds:YES];
    [aboutMissionLayer setCornerRadius:50.0];
    
    CALayer *socialMediaLayer = [self.socialMediaImage layer];
    [socialMediaLayer setMasksToBounds:YES];
    [socialMediaLayer setCornerRadius:50.0];
    
    CALayer *photoImageLayer = [self.photoImage layer];
    [photoImageLayer setMasksToBounds:YES];
    [photoImageLayer setCornerRadius:50.0];
    
    CALayer *scheduleImageLayer = [self.scheduleImage layer];
    [scheduleImageLayer setMasksToBounds:YES];
    [scheduleImageLayer setCornerRadius:50.0];
    
    CALayer *listenOnlineLayer = [self.listenOnlineImage layer];
    [listenOnlineLayer setMasksToBounds:YES];
    [listenOnlineLayer setCornerRadius:50.0];
    
    CALayer *musicImageLayer = [self.musicImage layer];
    [musicImageLayer setMasksToBounds:YES];
    [musicImageLayer setCornerRadius:50.0];
    
    CALayer *blogImageLayer = [self.blogImage layer];
    [blogImageLayer setMasksToBounds:YES];
    [blogImageLayer setCornerRadius:50.0];
    
    CALayer *getInvolvedLayer = [self.getInvolvedImage layer];
    [getInvolvedLayer setMasksToBounds:YES];
    [getInvolvedLayer setCornerRadius:50.0];
    
}


@end
