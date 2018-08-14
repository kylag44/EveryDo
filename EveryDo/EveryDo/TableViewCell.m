//
//  TableViewCell.m
//  EveryDo
//
//  Created by Kyla  on 2018-08-14.
//  Copyright © 2018 Kyla . All rights reserved.
//

#import "TableViewCell.h"
#import "ToDo.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/////////////configures the cell to theobject 
-(void)congfigureCell:(ToDo *)theObject {
   
    _dataObject = theObject;
    /////gettting to do object from view controller and setting the property
    self.toDoListTitle = theObject.toDoTitle;
    self.toDoDescription = theObject.toDoDescription;
    self.toDoPriority = theObject.priorityNumber;
    self.toDoListLabel.text = self.toDoListTitle;
    
        
    }
    

@end
