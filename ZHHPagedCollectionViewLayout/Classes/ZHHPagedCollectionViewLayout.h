//
//  ZHHPagedCollectionViewLayout.h
//  ZHHPagedCollectionViewLayout_Example
//
//  Created by 桃色三岁 on 2022/12/9.
//  Copyright © 2022 yue5yueliang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
IB_DESIGNABLE
@interface ZHHPagedCollectionViewLayout : UICollectionViewLayout
// default 5
@property (nonatomic, assign) IBInspectable NSUInteger zhh_columns;
// default 5
@property (nonatomic, assign) IBInspectable NSUInteger zhh_rows;
// default {64, 64}
@property (nonatomic, assign) IBInspectable CGSize zhh_itemSize;
// default {8, 8, 8, 8}
@property (nonatomic, assign) IBInspectable UIEdgeInsets zhh_edgeInsets;
@end

NS_ASSUME_NONNULL_END
