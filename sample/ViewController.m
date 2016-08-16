//
//  ViewController.m
//  sample
//
//  Created by Revo Tech on 7/20/16.
//  Copyright © 2016 Revo Tech. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *colview;
@property (strong,nonatomic) NSMutableArray *array;
@end

@implementation ViewController

#pragma mark - View Lifecycle -

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.array removeAllObjects];
    _array = @[@"time:",// @"2",@"items",@"10",@"difficulty:",@"hard",@"category",@"main"];
    //    for (int i = 0; i < kNumberOfCells; ++i) {
    ///       [self.array addObject:[RandomStringGenerator randomStringWithLength:MAX(kMinStringLength,arc4random_uniform(kMaxStringLength))]];
    //    }
    //    [self.collectionView registerClass:[SimpleCell class] forCellWithReuseIdentifier:NSStringFromClass([SimpleCell class])];
    // self.collectionView.dataSource = self;
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reload) name:UIContentSizeCategoryDidChangeNotification object:nil];
    [self setEstimatedSizeIfNeeded];
}

- (void)setEstimatedSizeIfNeeded {
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)self.colview.collectionViewLayout;
    CGFloat estimatedWidth = 30.f;
    if (flowLayout.estimatedItemSize.width != estimatedWidth) {
        [flowLayout setEstimatedItemSize:CGSizeMake(estimatedWidth, 100)];
        [flowLayout invalidateLayout];
    }
}

//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
//    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
//        
//    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
//     //   [self.collectionViewLayout invalidateLayout];
//        [self.colview reloadData];
//    }];
//}
#pragma mark - UICollectionViewDataSource -
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"identifier" forIndexPath:indexPath];
    cell.text = _array[indexPath.row];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _array.count;
}

#pragma mark - Convenience =
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (NSMutableArray *)array {
    if (!_array) {
        _array = [NSMutableArray array];
    }
    return _array;
}

- (void)reload {
    [self setEstimatedSizeIfNeeded];
    [self.colview reloadData];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
