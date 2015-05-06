//
//  SocialMediaViewController.m
//  BasicAtLang
//
//  Created by Ethan Westering on 3/2/15.
//  Copyright (c) 2015 EthanWestering. All rights reserved.
//

#import "SocialMediaViewController.h"
#import "AddPostViewController.h"
#import "CustomSocialMediaTableViewCell.h"
#import "FullPostViewController.h"

@interface SocialMediaViewController ()
@property (strong, nonatomic) UIImageView *fullPostImageView;
@end

@implementation SocialMediaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Social Media";
    self.socialPostsTableView.delegate = self;
    self.socialPostsTableView.dataSource = self;
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [self.socialPostsTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)goToStoryView:(id)sender {
    AddPostViewController *addPostViewController = [AddPostViewController new];
    [self.navigationController pushViewController:addPostViewController animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *itemsArray = [defaults valueForKey:@"socialPosts"];
    return [itemsArray count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"mrCell";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    CustomSocialMediaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[CustomSocialMediaTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSArray *pictures = [defaults valueForKey:@"socialPosts"];
    NSData *imageData = pictures[indexPath.item];
    UIImage* image = [UIImage imageWithData:imageData];
    cell.cellImageView.image = image;
    NSArray *text = [defaults valueForKey:@"textPosts"];
    cell.cellTextView.text = text[indexPath.item];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *pictures = [defaults valueForKey:@"socialPosts"];
    NSData *imageData = pictures[indexPath.item];
    UIImage* image = [UIImage imageWithData:imageData];
    NSArray *text = [defaults valueForKey:@"textPosts"];
    
    float actualHeight = image.size.height;
    float actualWidth = image.size.width;
    float ratio=300/actualWidth;
    actualHeight = actualHeight*ratio;
    
    CGRect rect = CGRectMake((self.view.frame.size.width/2),150, 300, actualHeight);
    self.fullPostImageView = [[UIImageView alloc]initWithFrame:rect];
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 1.0);
    [image drawInRect:rect];
    UIGraphicsEndImageContext();
    self.fullPostImageView.image=image;
//    self.fullPostImageView.center = self.view.center;
    self.fullPostImageView.center = CGPointMake(self.view.frame.size.width  / 2,
                                                self.view.frame.size.height /2 - 200);
    FullPostViewController *fpvc = [[FullPostViewController alloc]initWithNibName:@"FullPostViewController" bundle:nil];
    [fpvc view];
    [fpvc.fullPostScrollView addSubview:self.fullPostImageView];
    fpvc.fullPostTextView.text = text[indexPath.item];
    [self.navigationController pushViewController:fpvc animated:YES];
    
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
