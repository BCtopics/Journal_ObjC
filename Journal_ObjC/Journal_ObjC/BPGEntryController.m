//
//  BPGEntryController.m
//  Journal_ObjC
//
//  Created by Bradley GIlmore on 6/19/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

#import "BPGEntryController.h"

@interface BPGEntryController()

@property (nonatomic, strong) NSMutableArray *internalEntries;

@end

@implementation BPGEntryController

#pragma mark - Shared Instances

+ (BPGEntryController *)sharedInstance
{
    static BPGEntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [BPGEntryController new];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalEntries = [NSMutableArray array];
    }
    return self;
}

#pragma mark - CRUD

- (NSArray *)entries { return self.internalEntries; }

- (void)addEntriesObject:(BPGEntry *)entry
{
    [self.internalEntries addObject:entry];
}

- (void)removeEntriesObject:(BPGEntry *)entry
{
    [self.internalEntries removeObject:entry];
}



@end
