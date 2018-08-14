//
//  ToDo.h
//  EveryDo
//
//  Created by Kyla  on 2018-08-14.
//  Copyright © 2018 Kyla . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject

@property (nonatomic, weak) NSString *toDoTitle;
@property (nonatomic, weak) NSString *toDoDescription;
@property (nonatomic) NSInteger priorityNumber;
@property (nonatomic) BOOL isCompletedIndicator;

-(instancetype)initWithToDoTitle:(NSString *)title toDoDescription:(NSString *)description priorityNumber:(NSInteger)priorityNumber isCompletedIndicator:(BOOL)isCompletedIndicator; 

@end
