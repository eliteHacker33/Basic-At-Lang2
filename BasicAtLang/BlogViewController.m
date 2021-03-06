//
//  BlogViewController.m
//  BasicAtLang
//
//  Created by Ethan Westering on 3/2/15.
//  Copyright (c) 2015 EthanWestering. All rights reserved.
//

#import "BlogViewController.h"
#import "CustomTableViewCell.h"
#import "BlogReaderViewController.h"
#import "Reachability.h"

@interface BlogViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableDictionary *blogDict;

@end

@implementation BlogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self blogReader];
//    [self.view addSubview:self.tableView];
    self.title = @"Blog Page";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSMutableDictionary *)blogDict{
    if(!_blogDict){
        _blogDict = [NSMutableDictionary new];
    }
    return _blogDict;
}

-(void)blogReader{
    int counter = 0;
    while(YES){
            NSString *pathName = [NSString stringWithFormat:@"http://www.basicatlang.org/blog?start=%d",counter];
            NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:pathName]];
            NSData *myData = [NSURLConnection sendSynchronousRequest:req returningResponse:nil error:nil];
            NSString *finalRespStr = [[NSString alloc] initWithData:myData encoding:NSUTF8StringEncoding];
        
//---------------------------------------------------------------------
//        NSString *pathName = [NSString stringWithFormat:@"/Users/ethanwestering/LayerOfAbstraction/Undergrad Research/blogs/BasicBlog%d.html",counter];
//        NSString *finalRespStr = [NSString stringWithContentsOfFile:pathName encoding:NSStringEncodingConversionAllowLossy error:nil];
//---------------------------------------------------------------------
        
            if ([finalRespStr rangeOfString:@"There are no articles in this category."].location != NSNotFound){
                break;
            }
            if (finalRespStr == nil) {
                break;
            }
            [self.blogDict setValue:finalRespStr forKey:[NSString stringWithFormat:@"basicBlog%d",counter]];
        
        counter ++;
    }

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.blogDict.allKeys count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"customTableViewCell";
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
//    cell.blogLabel.text = [NSString stringWithFormat: @"Basic Blog %ld",indexPath.item + 1];

//---------------------------------------------------------------------
    cell.blogLabel.text = [NSString stringWithFormat: @"Basic Blog %ld",indexPath.item + 1];
//---------------------------------------------------------------------
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *file = [self.blogDict valueForKey:[NSString stringWithFormat:@"basicBlog%ld", indexPath.item]];
//---------------------------------------------------------------------
//        NSString *file = [self.blogDict valueForKey:[NSString stringWithFormat:@"basicBlog%ld", indexPath.item + 1]];
//---------------------------------------------------------------------
    
    BlogReaderViewController *brvc = [BlogReaderViewController new];
    [brvc setTextOnBlogTextView:file];
//    brvc.blogTextView.text = file;
    [self.navigationController pushViewController:brvc animated:YES];
}


@end
