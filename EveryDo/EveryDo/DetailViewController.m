//
//  DetailViewController.m
//  EveryDo
//
//  Created by Kyla  on 2018-08-14.
//  Copyright © 2018 Kyla . All rights reserved.
//

#import "DetailViewController.h"
#import "ToDo.h"

@interface DetailViewController ()





@end

@implementation DetailViewController


///////declare the properties and set the text 
- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameLabel.text = self.toDoNameLabel;
    self.descriptionLabe.text = self.toDoDescriptionLabel;
    self.priorityLabel.text = self.toDoPriorityLabel;
}





@end
