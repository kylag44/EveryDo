//
//  ToDo.m
//  EveryDo
//
//  Created by Kyla  on 2018-08-14.
//  Copyright © 2018 Kyla . All rights reserved.
//

#import "ToDo.h"

@implementation ToDo


-(instancetype)initWithToDoTitle:(NSString *)title toDoDescription:(NSString *)description priorityNumber:(NSInteger)priorityNumber isCompletedIndicator:(BOOL)isCompletedIndicator {
    if (self = [super init]) {
        _toDoTitle = title;
        _toDoDescription = description;
        _priorityNumber = priorityNumber;
        _isCompletedIndicator = NO;
    }
return self;
}





@end
