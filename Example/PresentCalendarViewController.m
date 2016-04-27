//
//  PresentCalendarViewController.m
//  SpringTourTicketMis
//
//  Created by Tony on 16/4/22.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import "PresentCalendarViewController.h"

@interface PresentCalendarViewController ()

@property (nonatomic,assign) BOOL startSelected;
@property (nonatomic,assign) BOOL endSelected;

@end

@implementation PresentCalendarViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)awakeFromNib{
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.ComfirmDate!=NULL) {
        if (self.startSelected==YES&&self.endSelected==YES) {
            self.ComfirmDate(self.startDate,self.endDate);
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.startDate==nil) {
        self.startDate=[NSDate date];
    }
    if (self.endDate==nil) {
        self.endDate=[NSDate date];
    }
    
    self.startSelected=YES;
    self.endSelected=YES;
    
    self.calendar.dataSource = self;
    self.calendar.delegate = self;
    self.calendar.allowsMultipleSelection=YES;
    
    self.calendar.scrollDirection=FSCalendarScrollDirectionVertical;
    
    self.calendar.appearance.adjustsFontSizeToFitContentSize=NO;
    self.calendar.appearance.titleFont=[UIFont systemFontOfSize:18];
    self.calendar.appearance.headerTitleFont=[UIFont systemFontOfSize:14];
    
    self.calendar.appearance.headerTitleColor=[UIColor colorWithRed:38/255.0 green:38/255.0 blue:38/255.0 alpha:1.0];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//选择的颜色
- (UIColor *)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance fillSelectionColorForDate:(NSDate *)date
{
    return [UIColor colorWithRed:36/255.0 green:154/255.0 blue:121/255.0 alpha:1.0];
}

- (nullable UIColor *)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance titleDefaultColorForDate:(NSDate *)date{
    if (([[NSDate date] compare:date]==NSOrderedAscending)) {
        return [UIColor grayColor];
    }
    return nil;
}

- (UIColor *)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance fillDefaultColorForDate:(NSDate *)date
{
    if ([self.startDate isEqualToDate:date]) {
        return [UIColor colorWithRed:36/255.0 green:154/255.0 blue:121/255.0 alpha:1.0];
    }
    if ([self.endDate isEqualToDate:date]) {
        return [UIColor colorWithRed:36/255.0 green:154/255.0 blue:121/255.0 alpha:1.0];
    }
    if (([self.startDate compare:date]==NSOrderedAscending)&&([date compare:self.endDate]==NSOrderedAscending)) {
        return [UIColor colorWithRed:181.0/255.0 green:193.0/255.0 blue:198.0/255.0 alpha:1.0];
    }
    
   return nil;
}

- (BOOL)calendar:(FSCalendar *)calendar shouldSelectDate:(NSDate *)date{
    if (([[NSDate date] compare:date]==NSOrderedAscending)) {
        return NO;
    }
    if (self.startSelected==YES&&self.endSelected==YES) {
        self.startDate=date;
        self.endDate=date;
        self.endSelected=NO;
    }
    else if (self.startSelected==YES&&self.endSelected==NO){
        if (([self.startDate compare:date]==NSOrderedAscending)) {
            self.endDate=date;
            self.endSelected=YES;
        }
        else if ([self.startDate compare:date]==NSOrderedDescending){
            self.startDate=date;
            self.endDate=date;
            self.endSelected=NO;
        }
        
    }
    
    [self.calendar reloadData];
    
    return NO;
}

//- (FSCalendarCellShape)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance cellShapeForDate:(NSDate *)date
//{
//    return FSCalendarCellShapeRectangle;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
