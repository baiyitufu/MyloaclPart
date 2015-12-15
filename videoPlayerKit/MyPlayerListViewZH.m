//
//  MyPlayerListViewZH.m
//  VideoDemo
//
//  Created by shinyv on 15/10/15.
//  Copyright (c) 2015年 wang. All rights reserved.
//

#import "MyPlayerListViewZH.h"

@implementation MyPlayerListViewZH



#define jiciDefaultTag 2321312
-(id)initWithFrame:(CGRect)frame{

     self=[super initWithFrame:frame];
    
    if (self) {
        
        tabView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        
        tabView.delegate=self;
        tabView.dataSource=self;
        
        [self addSubview:tabView];
        
         mySrollView =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        mySrollView.hidden=YES;
        [self addSubview:mySrollView];
        
      
        [self reloadMyListViewWithArray:nil andIsTvProgram:YES andSelectIndex:12];
        
      }
     return self;
}



-(void)reloadMyListViewWithArray:(NSMutableArray *)arr andIsTvProgram:(BOOL)isTvPro andSelectIndex:(NSInteger*)selectIndex{

    
    self.currentPlayIndex=selectIndex;
    
    if (isTvPro) {
        tabView.hidden=YES;
        mySrollView.hidden=NO;
        
        [self reloadMyScrollView:arr];

    }else{
        
        mySrollView.hidden=YES;
        [tabView reloadData];
    }

    
}



-(void)reloadMyScrollView:(NSMutableArray *)temArr{

    
    temArr =[NSMutableArray
             arrayWithCapacity:0];
    for (int i=0; i<90; i++) {
        
        [temArr addObject:@"2"];
        
    }
    
    
    int colums=4;

    int rows=(temArr.count%colums)?(temArr.count/colums+1):temArr.count/colums;
    
    
    
    for (int i=0; i<rows; i++) {
        
        for (int j=0; j<colums; j++) {
            
            if (!(i*colums+j<temArr.count)) {
                return;
            }
            
            UIButton * button =[UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:[NSString stringWithFormat:@"%d",i*colums+j+1] forState:UIControlStateNormal];
            [button.layer setBorderWidth:1];
            button.layer.cornerRadius = 3;
//            [button setTitleColor:RGB(111, 111, 111, 1) forState:UIControlStateNormal];
//            [button setTitleColor:RGB(1, 174, 240, 1) forState:UIControlStateSelected];
            if (i*colums+j+1==self.currentPlayIndex) {
                [button setSelected:YES];
            }
            
             button.tag=i*colums+j+jiciDefaultTag;
//            [button.layer setBorderColor:RGB(211, 211, 211, 1).CGColor];
            button.frame=CGRectMake(15+j*(90), 50+i*(35+15), 80, 35);
            button.backgroundColor=[UIColor clearColor];
            button.titleLabel.font=[UIFont systemFontOfSize:15];
            button.showsTouchWhenHighlighted=YES;
            [button addTarget:self action:@selector(someOfAllListClicked:) forControlEvents:UIControlEventTouchUpInside];
            [mySrollView addSubview:button];
            mySrollView.contentSize=CGSizeMake(mySrollView.frame.size.width, rows*50+50+50 );
        }
        
    }

    
}



-(void)someOfAllListClicked:(UIButton *)btn{
    
    for (UIButton * temBtn in mySrollView.subviews) {
        
        if ([temBtn isKindOfClass:[UIButton class]]) {
            [temBtn setSelected:NO];
            
        }
    }
    
    [btn setSelected:YES];
    
//    if (self.delegate&&[self.delegate respondsToSelector:@selector(JiciListDidselectedIndex:)]) {
//        [self.delegate JiciListDidselectedIndex:btn.tag-jiciDefaultTag+1];
//        [self disMissSelf];
//    }
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return 10;

    return self.dataArray.count;
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
      return 41;
    
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    if (self.delegate) {
        
        [self.delegate     didChooseIndex:indexPath.row andContent:nil];
     }

    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
     cell.textLabel.text=@"wwwwwwwww";
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
