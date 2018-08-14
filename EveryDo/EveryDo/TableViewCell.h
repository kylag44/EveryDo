//
//  TableViewCell.h
//  EveryDo
//
//  Created by Kyla  on 2018-08-14.
//  Copyright © 2018 Kyla . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *completedLabel;

@property (weak, nonatomic) IBOutlet UILabel *toDoListLabel;
///////////make more properties
@property (readonly, strong, nonatomic) ToDo* dataObject; 

@property (strong, nonatomic) NSString *toDoListTitle;
@property (strong, nonatomic) NSString *toDoDescription;
@property (nonatomic) NSInteger toDoPriority;



-(void)congfigureCell:(ToDo *)theObject;

@end
