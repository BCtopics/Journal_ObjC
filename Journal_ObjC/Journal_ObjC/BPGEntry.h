//
//  BPGEntry.h
//  Journal_ObjC
//
//  Created by Bradley GIlmore on 6/19/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BPGEntry : NSObject

- (instancetype)initWithTitle:(NSString *)title
                         text:(NSString *)text
                    timestamp:(NSDate *)timestamp;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

#pragma mark - Properties

- (NSDictionary *)dictionaryRepresentation;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *bodytext;
@property (nonatomic, strong) NSDate *timestamp;

@end
