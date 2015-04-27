//
//  PhotosViewController.m
//  BasicAtLang
//
//  Created by Ethan Westering on 3/2/15.
//  Copyright (c) 2015 EthanWestering. All rights reserved.
//

#import "PhotosViewController.h"
#import "CustomCell.h"
#import "FullPhotoViewController.h"

@interface PhotosViewController ()

@property (nonatomic, strong) NSMutableArray *arrayOfPhotos;

@property (nonatomic, strong) UIImage *currentImage;

@end

@implementation PhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Photos";
    [[self myCollectionView]setDataSource:self];
    [[self myCollectionView]setDelegate:self];
    [self readFromAFile];
    // Do any additional setup after loading the view from its nib.
    
}

- (void)viewDidLayoutSubviews {
    [self.myCollectionView setContentOffset:CGPointZero animated:NO];
}

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
    FullPhotoViewController *fullPhotoVC = [FullPhotoViewController new];
    [fullPhotoVC setFullViewImage:self.currentImage];
    [self.navigationController pushViewController:fullPhotoVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)userTappedImage: (UITapGestureRecognizer *) tapGesture{
//    FullPhotoViewController *fullPhotoVC = [FullPhotoViewController new];
//    [fullPhotoVC setFullViewImage:self.currentImage];
//    fullPhotoVC.fullImageView.image = self.currentImage;
//    [self.navigationController pushViewController:fullPhotoVC animated:YES];
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
