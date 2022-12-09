//
//  ZHHViewController.m
//  ZHHPagedCollectionViewLayout
//
//  Created by 桃色三岁 on 12/09/2022.
//  Copyright (c) 2022 桃色三岁. All rights reserved.
//

#import "ZHHViewController.h"
#import "ZHHPagedCollectionViewLayout.h"

@interface ZHHCollectionLabledCell : UICollectionViewCell
@property (nonatomic, strong) UILabel *browseLabel;
@end

@implementation ZHHCollectionLabledCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self configure];
    }
    return self;
}

- (void)configure{
    [self.contentView addSubview:self.browseLabel];
    self.backgroundColor = UIColor.orangeColor;
    self.browseLabel.frame = self.bounds;
}

- (UILabel *)browseLabel{
    if (!_browseLabel) {
        _browseLabel = [[UILabel alloc] init];
        _browseLabel.textColor = UIColor.whiteColor;
        _browseLabel.textAlignment = NSTextAlignmentCenter;
        _browseLabel.font = [UIFont systemFontOfSize:15];
    }
    return _browseLabel;
}
@end

@interface ZHHViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView  *collectionView;
@end

@implementation ZHHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self initSubViews];
}

- (void)initSubViews{
    ZHHPagedCollectionViewLayout *flowLayout = [[ZHHPagedCollectionViewLayout alloc] init];
    flowLayout.zhh_rows = 3;
    flowLayout.zhh_columns = 5;
    flowLayout.zhh_itemSize = CGSizeMake(64, 64);
    /// CollectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:flowLayout];
    collectionView.backgroundColor = UIColor.clearColor;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.showsHorizontalScrollIndicator = YES;
    collectionView.showsVerticalScrollIndicator = YES;
    collectionView.pagingEnabled = YES;
    collectionView.scrollEnabled = YES;
    self.collectionView = collectionView;
    [self.view addSubview:collectionView];
    self.collectionView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 240);
    self.collectionView.center = self.view.center;
    /// 注册cell
    [self.collectionView registerClass:ZHHCollectionLabledCell.class forCellWithReuseIdentifier:@"ZHHCollectionLabledCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionView
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 133;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZHHCollectionLabledCell *tools = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZHHCollectionLabledCell" forIndexPath:indexPath];
    tools.browseLabel.text = [NSString stringWithFormat:@"%d", (int)indexPath.item];
    return tools;
}
@end
