//
//  JZXCalendarManager.m
//  JZXCalendar
//
//  Created by macbook on 2017/10/19.
//  Copyright © 2017年 macbook. All rights reserved.
//

#import "JZXCalendarManager.h"

@interface JZXCalendarManager ()

@end

@implementation JZXCalendarManager

/*
 NSCalendarUnitEra            -- 纪元单位。对于 NSGregorianCalendar (公历)来说，只有公元前(BC)和公元(AD)；
 而对于其它历法可能有很多，例如日本和历是以每一代君王统治来做计算。
 NSCalendarUnitYear           -- 年单位。值很大，相当于经历了多少年，未来多少年。
 NSCalendarUnitMonth          -- 月单位。范围为1-12
 NSCalendarUnitDay            -- 天单位。范围为1-31
 NSCalendarUnitHour           -- 小时单位。范围为0-24
 NSCalendarUnitMinute         -- 分钟单位。范围为0-60
 NSCalendarUnitSecond         -- 秒单位。范围为0-60
 NSCalendarUnitWeekday        -- 星期单位，每周的7天。范围为1-7（最小周第一天为第一天）
 NSCalendarUnitWeekdayOrdinal -- 以7天为单位，范围为1-5 （1-7号为第1个7天，8-14号为第2个7天...)(1号为第一天)
 NSCalendarUnitQuarter        -- 季度。范围为1-4
 NSCalendarUnitWeekOfMonth    -- 周单位。范围...
 NSCalendarUnitWeekOfYear     -- 周单位。范围为1-53
 NSCalendarUnitWeekOfMonth    -- 月包含的周数。最多为6个周
 NSCalendarUnitWeekOfYear          -- 年包含的周数。最多为53个周
 NSCalendarUnitYearForWeekOfYear   -- 没完全搞清楚
 NSCalendarUnitNanosecond          -- 纳秒单位
 NSCalendarUnitCalendar            --
 NSCalendarUnitTimeZone            -- 没完全搞清楚
 */

- (void)setFirstWeekday:(JZXCalendarFirstWeekDay)firstWeekDay {
    [self.calendar setFirstWeekday:firstWeekDay];
}

- (NSDate *)theFirstDayOfWeekInMonth:(NSDate *)month {
    return nil;
}

- (NSDate *)theFirstDayOfTheMonth:(NSDate *)month {
    
    NSDateComponents *dc = [self.calendar component:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond fromDate:month];
    dc.day = 1;
    [self.calendar dateFromComponents:dc];
    return nil;
}

- (NSDate *)theFirstDayOfTheWeek:(NSDate *)week {
    return nil;
}

#pragma mark - getter

- (NSCalendar *)calendar{
    if (!_calendar) {
        _calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    }
    return _calendar;
}

#pragma mark - 单例

static id _instance;
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

+ (instancetype)manager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (id)copyWithZone:(NSZone *)zone{
    return _instance;
}

@end
