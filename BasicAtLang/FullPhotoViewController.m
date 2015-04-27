//
//  FullPhotoViewController.m
//  BasicAtLang
//
//  Created by Ethan Westering on 4/24/15.
//  Copyright (c) 2015 EthanWestering. All rights reserved.
//

#import "FullPhotoViewController.h"

@interface FullPhotoViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *fullImageView;
@property (weak, nonatomic) IBOutlet UIScrollView *zoomView;

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
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    UIImageView *dot =[[UIImageView alloc] initWithFrame:CGRectMake(0, 150, screenWidth, screenHeight - 250)];
    dot.image=image;
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
