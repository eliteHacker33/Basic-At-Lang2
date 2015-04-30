//
//  AboutMissionViewController.m
//  BasicAtLang
//
//  Created by Ethan Westering on 3/2/15.
//  Copyright (c) 2015 EthanWestering. All rights reserved.
//

#import "AboutMissionViewController.h"

@interface AboutMissionViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *aboutWebView;

@end

@implementation AboutMissionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"About";
    NSString *pathName = [NSString stringWithFormat:@"http://www.basicatlang.org/about"];
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:pathName]];
    NSData *myData = [NSURLConnection sendSynchronousRequest:req returningResponse:nil error:nil];
    NSString *finalRespStr = [[NSString alloc] initWithData:myData encoding:NSUTF8StringEncoding];
//------------------------------------------------------------------
//    NSString *pathName = [NSString stringWithFormat:@"/Users/ethanwestering/LayerOfAbstraction/Undergrad Research/about/aboutBasic.html"];
//    NSString *finalRespStr = [NSString stringWithContentsOfFile:pathName encoding:NSStringEncodingConversionAllowLossy error:nil];
//-------------------------------------------------------------------
    [self.aboutWebView loadHTMLString:finalRespStr baseURL:nil];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidLayoutSubviews {

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
