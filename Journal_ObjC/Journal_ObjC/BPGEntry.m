//
//  BPGEntry.m
//  Journal_ObjC
//
//  Created by Bradley GIlmore on 6/19/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

#import "BPGEntry.h"

@implementation BPGEntry

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

@end
