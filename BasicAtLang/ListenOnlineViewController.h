//
//  ListenOnlineViewController.h
//  BasicAtLang
//
//  Created by Ethan Westering on 3/2/15.
//  Copyright (c) 2015 EthanWestering. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListenOnlineViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIPageControl *pageController;
//@property (weak, nonatomic) IBOutlet UITextView *onlineTeachingTextView;

@property (weak, nonatomic) IBOutlet UIWebView *onlineWebView;


@end
