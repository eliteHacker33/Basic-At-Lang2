//
//  ListenOnlineViewController.m
//  BasicAtLang
//
//  Created by Ethan Westering on 3/2/15.
//  Copyright (c) 2015 EthanWestering. All rights reserved.
//

#import "ListenOnlineViewController.h"


@interface ListenOnlineViewController ()
//@property (weak, nonatomic) IBOutlet UITextView *getInvolvedTextView;

@end

@implementation ListenOnlineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Listen Online";

    [self.pageController addTarget:self action:@selector(pageDidSwitch:) forControlEvents:UIControlEventValueChanged];

    [self pageDidSwitch:self.pageController];

    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidLayoutSubviews {
//    [self.getInvolvedTextView setContentOffset:CGPointZero animated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pageDidSwitch:(UIPageControl *) page{
    if(self.pageController.currentPage ==0)
    {
        NSString *parableURL = @"http://www.basicatlang.org/media-center/listen-online/76-parables";
        [self.onlineWebView loadHTMLString:[self createPageForOnlineTeachingForURL:parableURL] baseURL:nil];
    }
    else if(self.pageController.currentPage ==1){
        NSString *parableURL = @"http://www.basicatlang.org/media-center/listen-online/85-maundythursday";
        [self.onlineWebView loadHTMLString:[self createPageForOnlineTeachingForURL:parableURL] baseURL:nil];
    }
    else if(self.pageController.currentPage ==2){
        NSString *parableURL = @"http://www.basicatlang.org/media-center/listen-online/75-faithanddoubt";
        [self.onlineWebView loadHTMLString:[self createPageForOnlineTeachingForURL:parableURL] baseURL:nil];
    }
    else if(self.pageController.currentPage ==3){
        NSString *parableURL = @"http://www.basicatlang.org/media-center/listen-online/69-identity";
        [self.onlineWebView loadHTMLString:[self createPageForOnlineTeachingForURL:parableURL] baseURL:nil];
    }
    else if(self.pageController.currentPage ==4){
        NSString *parableURL = @"http://www.basicatlang.org/media-center/listen-online/44-shoot-christians-say";
        [self.onlineWebView loadHTMLString:[self createPageForOnlineTeachingForURL:parableURL] baseURL:nil];
    }
    else if(self.pageController.currentPage ==5){
        NSString *parableURL = @"http://www.basicatlang.org/media-center/listen-online/72-spoken-word";
        [self.onlineWebView loadHTMLString:[self createPageForOnlineTeachingForURL:parableURL] baseURL:nil];
    }
    else if(self.pageController.currentPage ==6){
        NSString *parableURL = @"http://www.basicatlang.org/media-center/listen-online/43-the-walking-dead";
        [self.onlineWebView loadHTMLString:[self createPageForOnlineTeachingForURL:parableURL] baseURL:nil];
    }
    else if(self.pageController.currentPage ==7){
        NSString *parableURL = @"http://www.basicatlang.org/media-center/listen-online/41-bless";
        [self.onlineWebView loadHTMLString:[self createPageForOnlineTeachingForURL:parableURL] baseURL:nil];
    }
    else if(self.pageController.currentPage ==8){
        NSString *parableURL = @"http://www.basicatlang.org/media-center/listen-online/42-stories-from-the-seats";
        [self.onlineWebView loadHTMLString:[self createPageForOnlineTeachingForURL:parableURL] baseURL:nil];
    }
    else if(self.pageController.currentPage ==9){
        NSString *parableURL = @"http://www.basicatlang.org/media-center/listen-online/40-2013-teachings";
        [self.onlineWebView loadHTMLString:[self createPageForOnlineTeachingForURL:parableURL] baseURL:nil];
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
