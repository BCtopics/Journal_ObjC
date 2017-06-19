//
//  BPGEntry.m
//  Journal_ObjC
//
//  Created by Bradley GIlmore on 6/19/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

#import "BPGEntry.h"

@implementation BPGEntry

static NSString *const TitleKey = @"title";
static NSString *const TextKey = @"text";
static NSString *const TimestampKey = @"timestamp";

#pragma mark - Initializers

- (instancetype)initWithTitle:(NSString *)title
                         text:(NSString *)text
                    timestamp:(NSDate *)timestamp
{
    self = [super init];
    if (self) {
        _title = title;
        _bodytext = text;
        _timestamp = timestamp;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *title = dictionary[TitleKey];
    NSString *text = dictionary[TextKey];
    NSDate *timestamp = dictionary[TimestampKey];
    return [self initWithTitle:title text:text timestamp:timestamp];
}

- (NSDictionary *)dictionaryRepresentation
{
    return @{TitleKey: self.title,
             TextKey: self.bodytext,
             TimestampKey: self.timestamp};
}

@end
