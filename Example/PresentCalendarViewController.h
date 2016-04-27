//
//  PresentCalendarViewController.h
//  SpringTourTicketMis
//
//  Created by Tony on 16/4/22.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FSCalendar/FSCalendar.h>

@interface PresentCalendarViewController : UIViewController<FSCalendarDataSource, FSCalendarDelegate,FSCalendarDelegateAppearance>
@property (strong, nonatomic) IBOutlet FSCalendar *calendar;

@property (strong,nonatomic) NSDate *startDate;
@property (strong,nonatomic) NSDate *endDate;

@property(nonatomic,copy) void (^ComfirmDate)(NSDate *startDate,NSDate *endDate);


@end
