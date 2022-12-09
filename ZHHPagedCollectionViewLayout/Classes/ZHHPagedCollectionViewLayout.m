//
//  ZHHPagedCollectionViewLayout.m
//  ZHHPagedCollectionViewLayout_Example
//
//  Created by 桃色三岁 on 2022/12/9.
//  Copyright © 2022 yue5yueliang. All rights reserved.
//

#import "ZHHPagedCollectionViewLayout.h"

@interface ZHHPagedCollectionViewLayout ()
@property (nonatomic, strong) NSArray <UICollectionViewLayoutAttributes *> *allAttributes;
@end

@implementation ZHHPagedCollectionViewLayout
- (void)_commonInit {
    self.zhh_columns = 5;
    self.zhh_rows = 5;
    self.zhh_itemSize = CGSizeMake(64, 64);
    self.zhh_edgeInsets = UIEdgeInsetsMake(8, 8, 8, 8);
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self _commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self _commonInit];
    }
    return self;
}

- (void)setZhh_columns:(NSUInteger)zhh_columns{
    if (_zhh_columns != zhh_columns) {
        _zhh_columns = zhh_columns;
        [self invalidateLayout];
    }
}

- (void)setZhh_rows:(NSUInteger)zhh_rows {
    if (_zhh_rows != zhh_rows) {
        _zhh_rows = zhh_rows;
        [self invalidateLayout];
    }
}

- (void)setZhh_itemSize:(CGSize)zhh_itemSize {
    if (!CGSizeEqualToSize(_zhh_itemSize, zhh_itemSize)) {
        _zhh_itemSize = zhh_itemSize;
        [self invalidateLayout];
    }
}

- (void)setZhh_edgeInsets:(UIEdgeInsets)zhh_edgeInsets {
    if (!UIEdgeInsetsEqualToEdgeInsets(_zhh_edgeInsets, zhh_edgeInsets)) {
        _zhh_edgeInsets = zhh_edgeInsets;
        [self invalidateLayout];
    }
}

- (void)prepareLayout {
    [super prepareLayout];
    if (!self.zhh_columns || !self.zhh_rows) return;
    
    CGRect rect = UIEdgeInsetsInsetRect(self.collectionView.bounds, self.zhh_edgeInsets);
    CGFloat offsetX = self.zhh_edgeInsets.left;
    CGFloat offsetY = self.zhh_edgeInsets.top;
    
    CGFloat marginX = 0.f;
    if (self.zhh_columns == 1) {
        offsetX += (CGRectGetWidth(rect) - self.zhh_itemSize.width) / 2;
    } else {
        marginX = (CGRectGetWidth(rect) - self.zhh_columns * self.zhh_itemSize.width) / (self.zhh_columns - 1);
    }
    
    CGFloat marginY = 0.f;
    if (self.zhh_rows == 1) {
        offsetY += (CGRectGetHeight(rect) - self.zhh_itemSize.height) / 2;
    } else {
        marginY = (CGRectGetHeight(rect) - self.zhh_rows * self.zhh_itemSize.height) / (self.zhh_rows - 1);
    }
    NSInteger pageSize = self.zhh_rows * self.zhh_columns;
    
    NSMutableArray *arr = [NSMutableArray array];
    
    NSInteger numberOfItems = [self.collectionView numberOfItemsInSection:0];
    for (NSInteger i = 0; i < numberOfItems; ++i) {
        
        NSInteger page = i / pageSize;
        NSInteger col = (i % pageSize) % self.zhh_columns;
        NSInteger row = (i % pageSize) / self.zhh_columns;
        
        UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i
                                                                                                                                            inSection:0]];
        //attr.size = self.zhh_itemSize;
        //attr.center = CGPointMake(self.collectionView.width * page + (marginX + self.zhh_itemSize.width) * col + marginX, (marginY + self.zhh_itemSize.height) * row + marginY);
        
        attr.frame = CGRectMake(offsetX + CGRectGetWidth(self.collectionView.bounds) * page + (marginX + self.zhh_itemSize.width) * col,
                                offsetY + (marginY + self.zhh_itemSize.height) * row,
                                self.zhh_itemSize.width, self.zhh_itemSize.height);
        
        [arr addObject:attr];
    }
    self.allAttributes = [NSArray arrayWithArray:arr];
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *arr = [NSMutableArray array];
    [self.allAttributes enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (CGRectIntersectsRect(rect, obj.frame))
            [arr addObject:obj];
    }];
    return arr;
}

- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.allAttributes[indexPath.item];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (CGSize)collectionViewContentSize {
    CGSize size = self.collectionView.bounds.size;
    
    CGFloat collectionViewWidth = self.collectionView.frame.size.width;
    NSInteger count = [self.collectionView.dataSource collectionView:self.collectionView numberOfItemsInSection:0];
    NSInteger pageSize = self.zhh_rows * self.zhh_columns;
    
    CGSize newSize = CGSizeMake(((count + pageSize - 1) / pageSize) * collectionViewWidth, size.height);
    
    return newSize;
}

@end
