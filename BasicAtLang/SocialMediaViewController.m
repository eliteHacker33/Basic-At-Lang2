//
//  SocialMediaViewController.m
//  BasicAtLang
//
//  Created by Ethan Westering on 3/2/15.
//  Copyright (c) 2015 EthanWestering. All rights reserved.
//

#import "SocialMediaViewController.h"
#import "AddPostViewController.h"

@interface SocialMediaViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SocialMediaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Social Media";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)goToStoryView:(id)sender {
    AddPostViewController *addPostViewController = [AddPostViewController new];
    [self.navigationController pushViewController:addPostViewController animated:YES];
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
