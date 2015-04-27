//
//  BlogReaderViewController.h
//  BasicAtLang
//
//  Created by Ethan Westering on 4/26/15.
//  Copyright (c) 2015 EthanWestering. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlogReaderViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *blogWebView;

- (void)setTextOnBlogTextView:(NSString *)blogText;

@end
