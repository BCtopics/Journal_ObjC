//
//  BPGEntryController.h
//  Journal_ObjC
//
//  Created by Bradley GIlmore on 6/19/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BPGEntry.h"

@interface BPGEntryController : NSObject

#pragma mark - Properties

@property (nonatomic, strong, readonly) NSArray *entries;

#pragma mark - CRUD

- (void)addEntriesObject:(BPGEntry *)entry;
- (void)removeEntriesObject:(BPGEntry *)entry;

@end
