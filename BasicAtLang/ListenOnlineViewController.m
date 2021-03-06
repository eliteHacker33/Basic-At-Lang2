//
//  ListenOnlineViewController.m
//  BasicAtLang
//
//  Created by Ethan Westering on 3/2/15.
//  Copyright (c) 2015 EthanWestering. All rights reserved.
//

#import "ListenOnlineViewController.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import "Reachability.h"


@interface ListenOnlineViewController ()
//@property (weak, nonatomic) IBOutlet UITextView *getInvolvedTextView;

@property (nonatomic) NetworkStatus status;
@end

@implementation ListenOnlineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Listen Online";

    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    [reachability startNotifier];
    
    self.status = [reachability currentReachabilityStatus];
    
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
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    self.status = [reachability currentReachabilityStatus];
    
    if(self.status == NotReachable){
        [self comeHereIfUserHasNoInternetConnection];
    }
    else{
        [self comeHereIfUserHasInternetConnection];
    }
}

-(NSString *)createPageForOnlineTeachingForURL:(NSString *)string{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:string]];
    NSData *myData = [NSURLConnection sendSynchronousRequest:req returningResponse:nil error:nil];
    NSString *finalRespStr = [[NSString alloc] initWithData:myData encoding:NSUTF8StringEncoding];
    
    [defaults setValue:finalRespStr forKey:[NSString stringWithFormat:@"%ld", self.pageController.currentPage]];
    
    return finalRespStr;
}

-(void)comeHereIfUserHasNoInternetConnection{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if(self.pageController.currentPage ==0){
        [self.onlineWebView loadHTMLString:[defaults valueForKey:[NSString stringWithFormat:@"%ld", self.pageController.currentPage]] baseURL:nil];
    }
    else if(self.pageController.currentPage ==1){
        [self.onlineWebView loadHTMLString:[defaults valueForKey:[NSString stringWithFormat:@"%ld", self.pageController.currentPage]] baseURL:nil];
    }
    else if(self.pageController.currentPage ==2){
        [self.onlineWebView loadHTMLString:[defaults valueForKey:[NSString stringWithFormat:@"%ld", self.pageController.currentPage]] baseURL:nil];
    }
    else if(self.pageController.currentPage ==3){
        [self.onlineWebView loadHTMLString:[defaults valueForKey:[NSString stringWithFormat:@"%ld", self.pageController.currentPage]] baseURL:nil];
    }
    else if(self.pageController.currentPage ==4){
        [self.onlineWebView loadHTMLString:[defaults valueForKey:[NSString stringWithFormat:@"%ld", self.pageController.currentPage]] baseURL:nil];
    }
    else if(self.pageController.currentPage ==5){
        [self.onlineWebView loadHTMLString:[defaults valueForKey:[NSString stringWithFormat:@"%ld", self.pageController.currentPage]] baseURL:nil];
    }
    else if(self.pageController.currentPage ==6){
        [self.onlineWebView loadHTMLString:[defaults valueForKey:[NSString stringWithFormat:@"%ld", self.pageController.currentPage]] baseURL:nil];
    }
    else if(self.pageController.currentPage ==7){
        [self.onlineWebView loadHTMLString:[defaults valueForKey:[NSString stringWithFormat:@"%ld", self.pageController.currentPage]] baseURL:nil];
    }
    else if(self.pageController.currentPage ==8){
        [self.onlineWebView loadHTMLString:[defaults valueForKey:[NSString stringWithFormat:@"%ld", self.pageController.currentPage]] baseURL:nil];
    }
    else if(self.pageController.currentPage ==9){
        [self.onlineWebView loadHTMLString:[defaults valueForKey:[NSString stringWithFormat:@"%ld", self.pageController.currentPage]] baseURL:nil];
    }

}

-(void)comeHereIfUserHasInternetConnection{
    if(self.pageController.currentPage ==0)
    {
        NSString *parableURL = @"http://www.basicatlang.org/media-center/listen-online/76-parables";
        [self.onlineWebView loadHTMLString:[self createPageForOnlineTeachingForURL:parableURL] baseURL:nil];
//---------------------------------------------------------------------
    //    [self.onlineWebView loadHTMLString:[self finalResponseString] baseURL:nil];
//---------------------------------------------------------------------
//        

        
    }
    else if(self.pageController.currentPage ==1){
        NSString *parableURL = @"http://www.basicatlang.org/media-center/listen-online/85-maundythursday";
        [self.onlineWebView loadHTMLString:[self createPageForOnlineTeachingForURL:parableURL] baseURL:nil];
        
//---------------------------------------------------------------------
//        [self.onlineWebView loadHTMLString:[self finalResponseString] baseURL:nil];
//---------------------------------------------------------------------
        
    }
    else if(self.pageController.currentPage ==2){
        NSString *parableURL = @"http://www.basicatlang.org/media-center/listen-online/75-faithanddoubt";
        [self.onlineWebView loadHTMLString:[self createPageForOnlineTeachingForURL:parableURL] baseURL:nil];
//---------------------------------------------------------------------
    //    [self.onlineWebView loadHTMLString:[self finalResponseString] baseURL:nil];
//---------------------------------------------------------------------
        
    }
    else if(self.pageController.currentPage ==3){
        NSString *parableURL = @"http://www.basicatlang.org/media-center/listen-online/69-identity";
        [self.onlineWebView loadHTMLString:[self createPageForOnlineTeachingForURL:parableURL] baseURL:nil];
//---------------------------------------------------------------------
//        [self.onlineWebView loadHTMLString:[self finalResponseString] baseURL:nil];
//---------------------------------------------------------------------
        
    }
    else if(self.pageController.currentPage ==4){
        NSString *parableURL = @"http://www.basicatlang.org/media-center/listen-online/44-shoot-christians-say";
        [self.onlineWebView loadHTMLString:[self createPageForOnlineTeachingForURL:parableURL] baseURL:nil];
//---------------------------------------------------------------------
//        [self.onlineWebView loadHTMLString:[self finalResponseString] baseURL:nil];
//---------------------------------------------------------------------
    }
    else if(self.pageController.currentPage ==5){
        NSString *parableURL = @"http://www.basicatlang.org/media-center/listen-online/72-spoken-word";
        [self.onlineWebView loadHTMLString:[self createPageForOnlineTeachingForURL:parableURL] baseURL:nil];
//---------------------------------------------------------------------
//        [self.onlineWebView loadHTMLString:[self finalResponseString] baseURL:nil];
//---------------------------------------------------------------------
    }
    else if(self.pageController.currentPage ==6){
        NSString *parableURL = @"http://www.basicatlang.org/media-center/listen-online/43-the-walking-dead";
        [self.onlineWebView loadHTMLString:[self createPageForOnlineTeachingForURL:parableURL] baseURL:nil];
//---------------------------------------------------------------------
//        [self.onlineWebView loadHTMLString:[self finalResponseString] baseURL:nil];
//---------------------------------------------------------------------
    }
    else if(self.pageController.currentPage ==7){
        NSString *parableURL = @"http://www.basicatlang.org/media-center/listen-online/41-bless";
        [self.onlineWebView loadHTMLString:[self createPageForOnlineTeachingForURL:parableURL] baseURL:nil];
//---------------------------------------------------------------------
//        [self.onlineWebView loadHTMLString:[self finalResponseString] baseURL:nil];
//---------------------------------------------------------------------
    }
    else if(self.pageController.currentPage ==8){
        NSString *parableURL = @"http://www.basicatlang.org/media-center/listen-online/42-stories-from-the-seats";
        [self.onlineWebView loadHTMLString:[self createPageForOnlineTeachingForURL:parableURL] baseURL:nil];
//---------------------------------------------------------------------
//        [self.onlineWebView loadHTMLString:[self finalResponseString] baseURL:nil];
//---------------------------------------------------------------------
    }
    else if(self.pageController.currentPage ==9){
        NSString *parableURL = @"http://www.basicatlang.org/media-center/listen-online/40-2013-teachings";
        [self.onlineWebView loadHTMLString:[self createPageForOnlineTeachingForURL:parableURL] baseURL:nil];
//---------------------------------------------------------------------
//        [self.onlineWebView loadHTMLString:[self finalResponseString] baseURL:nil];
//---------------------------------------------------------------------
    }

}

- (NSString *)finalResponseString{
    NSString *pathName = [NSString stringWithFormat:@"/Users/ethanwestering/LayerOfAbstraction/Undergrad Research/onlineTeachings/individualOnlineTeachings/onlineTeaching%ld.html",self.pageController.currentPage];
    NSString *finalRespStr = [NSString stringWithContentsOfFile:pathName encoding:NSStringEncodingConversionAllowLossy error:nil];
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
