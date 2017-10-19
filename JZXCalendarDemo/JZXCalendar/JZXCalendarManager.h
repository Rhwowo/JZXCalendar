//
//  JZXCalendarManager.h
//  JZXCalendar
//
//  Created by macbook on 2017/10/19.
//  Copyright © 2017年 macbook. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, JZXCalendarFirstWeekDay) {
    JZXCalendarFirstWeekDaySunday = 1,
    JZXCalendarFirstWeekDayMonday,
    JZXCalendarFirstWeekDayMondayTuesday,
    JZXCalendarFirstWeekDayMondayWednesday,
    JZXCalendarFirstWeekDayMondayThursday,
    JZXCalendarFirstWeekDayMondayFriday,
    JZXCalendarFirstWeekDayMondaySaturday
};

@interface JZXCalendarManager : NSObject

+ (instancetype)manager;

@property (strong, nonatomic) NSCalendar *calendar;

/**
 设置每周第一天为周几

 @param firstWeekDay 周几
 */
- (void)setFirstWeekday:(JZXCalendarFirstWeekDay)firstWeekDay;

/**
 返回指定日期所在月的第一周的第一天
 
 @param month 指定日期
 @return 返回日期
 */
- (NSDate *)theFirstDayOfWeekInMonth:(NSDate *)month;

/**
 返回指定日期所在月的第一天

 @param month 指定日期
 @return 返回日期
 */
- (NSDate *)theFirstDayOfTheMonth:(NSDate *)month;


/**
 返回指定日期所在周的第一天

 @param week 指定日期
 @return 返回日期
 */
- (NSDate *)theFirstDayOfTheWeek:(NSDate *)week;

@end
