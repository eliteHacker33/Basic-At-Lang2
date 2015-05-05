//
//  AddPostViewController.h
//  BasicAtLang
//
//  Created by Ethan Westering on 4/19/15.
//  Copyright (c) 2015 EthanWestering. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddPostViewController : UIViewController <UINavigationControllerDelegate,UIImagePickerControllerDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *chosenImage;
@property (weak, nonatomic) IBOutlet UIButton *setPost;

//@property (weak, nonatomic) IBOutlet UITextField *postText;
@property (weak, nonatomic) IBOutlet UITextView *userText;

@end
