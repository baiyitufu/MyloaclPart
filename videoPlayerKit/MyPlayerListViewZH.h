//
//  MyPlayerListViewZH.h
//  VideoDemo
//
//  Created by shinyv on 15/10/15.
//  Copyright (c) 2015年 wang. All rights reserved.
//



@protocol MyPlayerListViewZHDelegate <NSObject>


-(void)didChooseIndex:(NSInteger)index andContent:(id)con;

@end
#import <UIKit/UIKit.h>



@interface MyPlayerListViewZH : UIView<UITableViewDelegate,UITableViewDataSource>

{

    UITableView * tabView;
    
    UIScrollView * mySrollView;
    
    
}

@property(nonatomic) BOOL isTvProgram;
@property(nonatomic,strong) NSMutableArray * dataArray ;
@property(nonatomic) NSInteger  currentPlayIndex ;
@property(nonatomic,assign)id<MyPlayerListViewZHDelegate> delegate;
-(id)initWithFrame:(CGRect)frame;
-(void)reloadMyListViewWithArray:(NSMutableArray *)arr andIsTvProgram:(BOOL)isTvPro andSelectIndex:(NSInteger*)selectIndex;

@end
