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

#pragma mark - Keys

static NSString * const EntriesKey = @"entries";

#pragma mark - Shared Instances

+ (BPGEntryController *)sharedInstance
{
    static BPGEntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [BPGEntryController new];
        [sharedInstance loadFromPersistentStorage];
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
    self.saveToPersistentStorage;
}

- (void)removeEntriesObject:(BPGEntry *)entry
{
    [self.internalEntries removeObject:entry];
    self.saveToPersistentStorage;
}

- (void)saveToPersistentStorage
{
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (BPGEntry *entry in self.entries) {
        [entryDictionaries addObject:entry.dictionaryRepresentation];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:EntriesKey];
}

- (void)loadFromPersistentStorage
{
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:EntriesKey];
    for (NSDictionary *dictionary in entryDictionaries) {
        BPGEntry *entry = [[BPGEntry alloc] initWithDictionary:dictionary];
        [self addEntriesObject:entry];
    }
}


@end
