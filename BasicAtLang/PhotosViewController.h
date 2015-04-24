//
//  PhotosViewController.h
//  BasicAtLang
//
//  Created by Ethan Westering on 3/2/15.
//  Copyright (c) 2015 EthanWestering. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotosViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;

@end
