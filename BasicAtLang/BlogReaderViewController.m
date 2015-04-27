//
//  BlogReaderViewController.m
//  BasicAtLang
//
//  Created by Ethan Westering on 4/26/15.
//  Copyright (c) 2015 EthanWestering. All rights reserved.
//

#import "BlogReaderViewController.h"

@interface BlogReaderViewController ()

@end

@implementation BlogReaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.blogWebView.clipsToBounds = NO;
//    self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setTextOnBlogTextView:(NSString *)blogText{
    [self loadView];
    [self.blogWebView loadHTMLString:blogText baseURL:nil];
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
