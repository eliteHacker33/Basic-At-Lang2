//
//  GetInvolvedViewController.m
//  BasicAtLang
//
//  Created by Ethan Westering on 3/8/15.
//  Copyright (c) 2015 EthanWestering. All rights reserved.
//

#import "GetInvolvedViewController.h"

@interface GetInvolvedViewController ()

@end

@implementation GetInvolvedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Get Involved";
    [self.getInvolvedPageController addTarget:self action:@selector(pageDidSwitch:) forControlEvents:UIControlEventValueChanged];
    
    [self pageDidSwitch:self.getInvolvedPageController];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pageDidSwitch:(UIPageControl *) page{

    if(self.getInvolvedPageController.currentPage ==0)
    {
        NSString *parableURL = @"http://www.basicatlang.org/get-involved/ministries";
        [self.getInvolvedWebView loadHTMLString:[self createPageForOnlineTeachingForURL:parableURL] baseURL:nil];
    }
    else if(self.getInvolvedPageController.currentPage ==1){
        NSString *parableURL = @"http://www.basicatlang.org/get-involved/basic-teams";
        [self.getInvolvedWebView loadHTMLString:[self createPageForOnlineTeachingForURL:parableURL] baseURL:nil];
    }
    else if(self.getInvolvedPageController.currentPage ==2){
        NSString *parableURL = @"http://www.basicatlang.org/get-involved/life-groups";
        self.getInvolvedWebView.scalesPageToFit = YES;
        [self.getInvolvedWebView loadHTMLString:[self createPageForOnlineTeachingForURL:parableURL] baseURL:nil];
//        self.getInvolvedWebView.scalesPageToFit = YES;
    }
    else if(self.getInvolvedPageController.currentPage ==3){
        NSString *parableURL = @"http://www.basicatlang.org/get-involved/sunday-morning";
        [self.getInvolvedWebView loadHTMLString:[self createPageForOnlineTeachingForURL:parableURL] baseURL:nil];
    }
    else if(self.getInvolvedPageController.currentPage ==4){
        NSString *parableURL = @"http://www.basicatlang.org/get-involved/32-upcoming-basic-events";
        [self.getInvolvedWebView loadHTMLString:[self createPageForOnlineTeachingForURL:parableURL] baseURL:nil];
    }

}

-(NSString *)createPageForOnlineTeachingForURL:(NSString *)string{
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:string]];
    NSData *myData = [NSURLConnection sendSynchronousRequest:req returningResponse:nil error:nil];
    NSString *finalRespStr = [[NSString alloc] initWithData:myData encoding:NSUTF8StringEncoding];
    return finalRespStr;
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
