//
//  PhotosViewController.m
//  BasicAtLang
//
//  Created by Ethan Westering on 3/2/15.
//  Copyright (c) 2015 EthanWestering. All rights reserved.
//

#import "PhotosViewController.h"
#import "CustomCell.h"

@interface PhotosViewController ()

@property (nonatomic, strong) NSMutableArray *arrayOfPhotos;

@property (nonatomic, strong) UIImage *currentImage;

@property (nonatomic)UIView *closeView;

@property (nonatomic)UIImageView *dot;

@end

@implementation PhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Photos";
    [[self myCollectionView]setDataSource:self];
    [[self myCollectionView]setDelegate:self];
    [self readFromAFile];
    [self.myCollectionView setContentOffset:CGPointZero animated:NO];
    // Do any additional setup after loading the view from its nib.
    
}

//- (void)viewDidLayoutSubviews {
//}

-(NSMutableArray *)arrayOfPhotos{
    if (!_arrayOfPhotos){
        _arrayOfPhotos = [NSMutableArray new];
    }
    return _arrayOfPhotos;
}

-(UIImage *)currentImage{
    if (!_currentImage){
        _currentImage = [UIImage new];
    }
    return _currentImage;
}

-(void)readFromAFile{

//    NSData *dataWithContent = [NSData dataWithContentsOfURL:url];
//    [self.arrayOfPhotos addObject:dataWithContent];
    int counter = 1;
    while (YES){

        if ([[[UIDevice currentDevice]model] isEqualToString:@"iPhone Simulator"]){
            NSString *pathName = [NSString stringWithFormat:@"Users/ethanwestering/LayerOfAbstraction/Undergrad Research/photos/individualPhotos/%d.jpg",counter];
            UIImage *image = [UIImage imageWithContentsOfFile:pathName];
            if(image == nil){
                break;
            }
            [self.arrayOfPhotos addObject:image];
        }
        else{
            NSString *imagePath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%d", counter] ofType:@"jpg"];
            UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
            if(image == nil){
                break;
            }
            [self.arrayOfPhotos addObject:image];
        }
        counter ++;
    }
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.arrayOfPhotos count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellName = @"Cell";
    CustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellName forIndexPath:indexPath];
    
    [[cell myImage]setImage:[self.arrayOfPhotos objectAtIndex:indexPath.item]];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.currentImage = [self.arrayOfPhotos objectAtIndex:indexPath.item];
    float actualHeight = self.currentImage.size.height;
    float actualWidth = self.currentImage.size.width;
    float ratio=300/actualWidth;
    actualHeight = actualHeight*ratio;

    CGRect rect = CGRectMake((self.view.frame.size.width/2),150, 300, actualHeight);
    self.dot = [[UIImageView alloc]initWithFrame:rect];
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 1.0);
    [self.currentImage drawInRect:rect];
    UIGraphicsEndImageContext();
    self.dot.image=self.currentImage;
    self.dot.center = self.view.center;
    self.closeView = [[UIView alloc]initWithFrame:[[UIScreen mainScreen]applicationFrame]];
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(touchedView:)];
    [self.closeView addGestureRecognizer:singleFingerTap];
    [self.view addSubview:self.dot];
    [self.view addSubview:self.closeView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchedView:(UIGestureRecognizer *)gesture{
    [self.closeView removeFromSuperview];
    [self.dot removeFromSuperview];
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
