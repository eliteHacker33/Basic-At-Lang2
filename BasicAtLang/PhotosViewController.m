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
//he defines global variables

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *arrayOfPhotos;

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

-(NSMutableArray *)arrayOfPhotos{
    if (!_arrayOfPhotos){
        _arrayOfPhotos = [NSMutableArray new];
    }
    return _arrayOfPhotos;
}

-(void)readFromAFile{

//    NSData *dataWithContent = [NSData dataWithContentsOfURL:url];
//    [self.arrayOfPhotos addObject:dataWithContent];
    int counter = 1;
    while (YES){
        NSString *pathName = [NSString stringWithFormat:@"%@%d%@",@"Users/ethanwestering/LayerOfAbstraction/Undergrad Research/photos/individualPhotos/", counter, @".jpg"];
        UIImage *image = [UIImage imageWithContentsOfFile:pathName];
        if(image == nil){
            break;
        }
        [self.arrayOfPhotos addObject:image];
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
//    [[cell myImage]setImage:[UIImage imageNamed:[self.arrayOfPhotos objectAtIndex:indexPath.item]]];
    [[cell myImage]setImage:[self.arrayOfPhotos objectAtIndex:indexPath.item]];
    [self.collectionView.collectionViewLayout invalidateLayout];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
