//
//  AddPostViewController.m
//  BasicAtLang
//
//  Created by Ethan Westering on 4/19/15.
//  Copyright (c) 2015 EthanWestering. All rights reserved.
//

#import "AddPostViewController.h"
#import "CustomSocialMediaTableViewCell.h"
#import "SocialMediaViewController.h"

@interface AddPostViewController () <UITextViewDelegate>

@end

@implementation AddPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Add Post";
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userDidTryToPickImage:)];
    
    [self.chosenImage addGestureRecognizer:tap];
    self.chosenImage.userInteractionEnabled = YES;
//    self.postText.delegate = self;
//    [self.postText setReturnKeyType:UIReturnKeyDone];
    [self.userText setReturnKeyType:UIReturnKeyDone];
    self.userText.delegate = self;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)automaticallyAdjustsScrollViewInsets{
    return NO;
}

//- (IBAction)dismissKeyboard:(id)sender;
//{
//    [self.postText becomeFirstResponder];
//    [self.postText resignFirstResponder];
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(void) userDidTryToPickImage:(UITapGestureRecognizer *)gesture{
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    
    // Don't forget to add UIImagePickerControllerDelegate in your .h
    picker.delegate = self;
    
    picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
//        picker.sourceType = UIImagePickerControllerSourceTypeCamera;

    [self presentViewController:picker animated:YES completion:nil];

}

- (void) imagePickerController:(UIImagePickerController *)picker
         didFinishPickingImage:(UIImage *)image
                   editingInfo:(NSDictionary *)editingInfo
{
    self.chosenImage.image = image;
    [self dismissModalViewControllerAnimated:YES];
//    float actualHeight = self.chosenImage.image.size.height;
//    float actualWidth = self.chosenImage.image.size.width;
//    float ratio=300/actualWidth;
//    actualHeight = actualHeight*ratio;
//    
//    CGRect rect = CGRectMake((self.view.frame.size.width/2),150, 300, actualHeight);
//    self.chosenImage.frame = rect;
//    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 1.0);
//    [self.currentImage drawInRect:rect];
//    UIGraphicsEndImageContext();
//    self.dot.image=self.currentImage;
//    self.dot.center = self.view.center;
//    self.closeView = [[UIView alloc]initWithFrame:[[UIScreen mainScreen]applicationFrame]];
}

- (IBAction)setSocialPost:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *textString = @"textPosts";
    NSString *photoString = @"socialPosts";
    
    NSMutableArray *photoArray = [NSMutableArray new];
    NSMutableArray *textArray = [NSMutableArray new];

    if (self.chosenImage.image != nil){
        if ([defaults valueForKey:photoString] != nil){
            photoArray = [[defaults valueForKey:photoString]mutableCopy];
            [photoArray addObject:UIImagePNGRepresentation(self.chosenImage.image)];
            [defaults setValue:photoArray forKey:photoString];
           textArray = [[defaults valueForKey:textString]mutableCopy];
            [textArray addObject:self.userText.text];
            [defaults setValue:textArray forKey:textString];
        }
        
        else{
            [photoArray addObject:UIImagePNGRepresentation(self.chosenImage.image)];
            [textArray addObject:self.userText.text];
            [defaults setValue:photoArray forKey:photoString];
            [defaults setValue:textArray forKey:textString];
        }
    }


    [defaults synchronize];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

@end
