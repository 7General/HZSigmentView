//
//  GZCCommonSegmentView.m
//  GZCSegmentView
//
//  Created by zzg on 2019/5/27.
//  Copyright © 2019 zzg. All rights reserved.
//

#import "GZCCommonSegmentView.h"

static NSInteger const segmentTag = 20000;

@interface GZCCommonSegmentView()
// 高度
@property (nonatomic, assign) CGFloat  menuHeight;
@property (nonatomic,strong) NSMutableArray * btnItemDatasource;

@property (nonatomic,strong) UIScrollView * contentScrollView;
@property (nonatomic,assign) CGFloat btnItemWidth;

@property (nonatomic, strong) UIButton * currentSelectButton;
@property (nonatomic, strong) UIView * currentBottomLine;

@property (nonatomic, assign) CGFloat segmentViewWidth;

@end

@implementation GZCCommonSegmentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.menuHeight = frame.size.height;
        self.translatesAutoresizingMaskIntoConstraints = YES;
        self.bottomViewHeight = 2;
        
        self.btnItemDatasource = [[NSMutableArray alloc] initWithCapacity:0];
        self.titleColorNormal = CColor(95, 102, 112);
        self.titleFontNormal = [UIFont systemFontOfSize:13];
        
        self.titleColorSelected = CColor(34, 172, 56);
        self.titleFontSelected = [UIFont systemFontOfSize:16];
        
        self.bottomViewColor = CColor(95, 102, 112);
        
        self.floatViewSize = CGSizeMake(15, 3);
        self.floatViewColor = CColor(34, 172, 56);
        self.floatCornerRadius = 2;
        
        
        self.segmentViewWidth = self.frame.size.width;
        
        self.contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.segmentViewWidth, self.menuHeight)];
        self.contentScrollView.showsHorizontalScrollIndicator = NO;
        self.contentScrollView.bounces = NO;
        [self addSubview:self.contentScrollView];
        
        
        [self registerForKVO];
    }
    return self;
}


-(void)registerForKVO {
    for (NSString *keyPath in [self observableKeypaths]) {
        [self addObserver:self forKeyPath:keyPath options:NSKeyValueObservingOptionNew context:NULL];
    }
}

- (NSArray *)observableKeypaths {
    return [NSArray arrayWithObjects: @"titleColorNormal", @"titleColorSelected", @"titleFont", @"bottomViewColor",@"bottomViewHeight",@"floatViewColor",@"floatViewSize",@"floatCornerRadius",@"selectIndex",@"titleFontNormal",@"titleFontSelected", nil];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    [self updateUIForKeypath:keyPath];
}

/**观察改变属性*/
- (void)updateUIForKeypath:(NSString *)keyPath {
    if([keyPath isEqualToString:@"titleColorNormal"] ||
       [keyPath isEqualToString:@"titleColorSelected"] ||
       [keyPath isEqualToString:@"titleFont"] ||
       [keyPath isEqualToString:@"titleFontNormal"] ||
       [keyPath isEqualToString:@"titleFontSelected"]) {
        [self updateView];
        
    } else if([keyPath isEqualToString:@"selectIndex"]) {
        [self selectIndexAtItem:self.selectIndex];
        
    } else if([keyPath isEqualToString:@"bottomViewColor"] || [keyPath isEqualToString:@"bottomViewHeight"]){
        [self updateBottomBorderView];
        
    } else if([keyPath isEqualToString:@"floatViewSize"] || [keyPath isEqualToString:@"floatViewColor"]) {
        [self updateFloatBottomView];
        
    } else if([keyPath isEqualToString:@"floatCornerRadius"]) {
        if (self.floatCornerRadius) {
            self.currentBottomLine.layer.cornerRadius = self.floatCornerRadius;
            self.currentBottomLine.layer.masksToBounds = YES;
        }
    }
}


/**
 更新悬浮view的frame和背景颜色
 */
- (void)updateFloatBottomView {
    self.currentBottomLine.frame = CGRectMake((_btnItemWidth - self.floatViewSize.width) * 0.5, _menuHeight - self.floatViewSize.height, self.floatViewSize.width, self.floatViewSize.height);
    self.currentBottomLine.backgroundColor = self.floatViewColor;
}

/**
 更新底部边框的frame和背景色
 */
- (void)updateBottomBorderView {
    UIView * line = [self viewWithTag:1100];
    line.backgroundColor = self.bottomViewColor;
    line.frame = CGRectMake(0, _menuHeight - _bottomViewHeight, _btnItemWidth * _dataSource.count, _bottomViewHeight);
}


-(void)updateView {
    for (NSInteger index = 0; index < self.btnItemDatasource.count; index++) {
        UIButton * curretnButton = [self.btnItemDatasource objectAtIndex:index];
        [curretnButton setTitleColor:self.titleColorNormal forState:UIControlStateNormal];
        [curretnButton setTitleColor:self.titleColorSelected forState:UIControlStateSelected];
        if (index == self.selectIndex) {
            curretnButton.titleLabel.font = self.titleFontSelected;
        } else {
            curretnButton.titleLabel.font = self.titleFontNormal;
        }
    }
}

-(void)dealloc {
    [self unregisterFromKVO];
}
- (void)unregisterFromKVO {
    for (NSString *keyPath in [self observableKeypaths]) {
        [self removeObserver:self forKeyPath:keyPath];
    }
}


- (void)setDataSource:(NSArray *)dataSource {
    if (!dataSource) return;
    
    _dataSource = dataSource;
    
    _btnItemWidth = _dataSource.count < 6 ? ceil(self.segmentViewWidth / _dataSource.count) : ceil(self.segmentViewWidth / 5);
    
    // 底边
    UIView *bottomLayerView = [[UIView alloc] initWithFrame:CGRectMake(0, _menuHeight - _bottomViewHeight, _btnItemWidth * _dataSource.count, _bottomViewHeight)];
    bottomLayerView.backgroundColor = self.bottomViewColor;
    bottomLayerView.tag = 1100;
    [self.contentScrollView addSubview:bottomLayerView];
    
    self.contentScrollView.contentSize = CGSizeMake(_btnItemWidth * _dataSource.count, _menuHeight);
    for (NSInteger index = 0; index < _dataSource.count; index++) {
        UIButton *itemButton = [UIButton buttonWithType:UIButtonTypeCustom];
        itemButton.frame = CGRectMake(_btnItemWidth * index, 0, _btnItemWidth, _menuHeight - _bottomViewHeight);
        itemButton.tag = index + segmentTag;
        [itemButton setTitle:_dataSource[index] forState:UIControlStateNormal];
        [itemButton setTitleColor:_titleColorNormal forState:UIControlStateNormal];
        [itemButton setTitleColor:_titleColorSelected forState:UIControlStateSelected];
        [itemButton addTarget:self action:@selector(btnTitleClick:) forControlEvents:UIControlEventTouchUpInside];
        itemButton.titleLabel.font = _titleFontNormal;
        
        if (index == 0) {
            itemButton.titleLabel.font = _titleFontSelected;
            itemButton.selected = YES;
        }
        
        [self.contentScrollView addSubview:itemButton];
        [self.btnItemDatasource addObject:itemButton];
    }
    
    
    if (self.btnItemDatasource.count) {
        self.currentSelectButton = self.btnItemDatasource.firstObject;
        self.currentSelectButton.selected = YES;
    }
    
    
    self.currentBottomLine = [[UIView alloc] initWithFrame:CGRectMake((_btnItemWidth - self.floatViewSize.width) * 0.5, _menuHeight - self.floatViewSize.height,self.floatViewSize.width, self.floatViewSize.height)];
    self.currentBottomLine.backgroundColor = self.floatViewColor;
    if (_floatCornerRadius) {
        self.currentBottomLine.layer.cornerRadius = _floatCornerRadius;
        self.currentBottomLine.layer.masksToBounds = YES;
    }
    [self.contentScrollView addSubview:self.currentBottomLine];
}

- (void)btnTitleClick:(UIButton *)sender {
    if(sender == self.currentSelectButton) return;
    
    [self selectIndexAtItem:sender.tag - segmentTag];
    if (self.delegate && [self.delegate respondsToSelector:@selector(commonSegment:didSelectIndex:)]) {
        [self.delegate commonSegment:self didSelectIndex:sender.tag - segmentTag];
    }
}

- (void)selectIndexAtItem:(NSInteger)index {
    if(index > self.btnItemDatasource.count) return;
    
    UIButton * selectButton = [self.btnItemDatasource objectAtIndex:index];
    
    self.currentSelectButton.selected = NO;
    selectButton.selected = YES;
    self.currentSelectButton = selectButton;
    
    //计算偏移量
    CGFloat offsetX = selectButton.frame.origin.x - 2 * self.btnItemWidth;
    if (offsetX<0) {
        offsetX=0;
    }
    CGFloat maxOffsetX= self.contentScrollView.contentSize.width - self.segmentViewWidth;
    if (offsetX>maxOffsetX) {
        offsetX=maxOffsetX;
    }
    [UIView animateWithDuration:0.25 animations:^{
        [self.contentScrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
        [self moveToIndex:selectButton.tag - segmentTag];
        [self updateFont:selectButton.tag - segmentTag];
    }];
}


- (void)updateFont:(NSInteger)currentIndex{
    if (currentIndex > self.btnItemDatasource.count) return;
        
    for (NSInteger index = 0 ; index < self.btnItemDatasource.count ; index++) {
        UIButton * currentButton = [self.btnItemDatasource objectAtIndex:index];
        if (index == currentIndex) {
            currentButton.titleLabel.font = self.titleFontSelected;
        } else {
            currentButton.titleLabel.font = self.titleFontNormal;
        }
    }
}


- (void)moveToIndex:(NSInteger)index {
    UIView *selectView = [self viewWithTag:segmentTag + index];
    CGPoint centerX = self.currentBottomLine.center;
    [UIView animateWithDuration:0.15 animations:^{
        self.currentBottomLine.center = CGPointMake(selectView.center.x, centerX.y);
    }];
}

@end
