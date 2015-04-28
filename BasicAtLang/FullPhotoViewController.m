//
//  FullPhotoViewController.m
//  BasicAtLang
//
//  Created by Ethan Westering on 4/24/15.
//  Copyright (c) 2015 EthanWestering. All rights reserved.
//

#import "FullPhotoViewController.h"

@interface FullPhotoViewController ()


@end

@implementation FullPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setFullViewImage:(UIImage *)image{

    float actualHeight = image.size.height;
    float actualWidth = image.size.width;
    float ratio=300/actualWidth;
    actualHeight = actualHeight*ratio;
    
//    CGRect rect = CGRectMake((self.view.frame.size.width/2) - (image.size.width/2), (self.view.frame.size.height/2) - (image.size.height/2), 300, actualHeight);

    CGRect rect = CGRectMake((self.view.frame.size.width/2),150, 300, actualHeight);
//    UIGraphicsBeginImageContext(rect.size);
    UIImageView *dot = [[UIImageView alloc]initWithFrame:rect];
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 1.0);
    [image drawInRect:rect];
    UIGraphicsEndImageContext();
    
    dot.image=image;
    dot.center = self.view.center;
    
    [self.view addSubview:dot];
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
