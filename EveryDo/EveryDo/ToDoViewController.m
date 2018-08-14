//
//  ToDoViewController.m
//  EveryDo
//
//  Created by Kyla  on 2018-08-14.
//  Copyright © 2018 Kyla . All rights reserved.
//

#import "ToDoViewController.h"
#import "ToDo.h"

@interface ToDoViewController ()

@end

@implementation ToDoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.nameTextField.text = self.nameText;
    self.descriptionTextField.text = self.descriptionText;
    self.priorityTextField.text = self.priorityText;

}


- (IBAction)saveButton:(id)sender {
    //////have to add the delegate and the class to this class with protocol as well
    NSLog(@"button pressed");
    
    ToDo *newToDo = [[ToDo alloc] initWithToDoTitle:self.nameTextField.text toDoDescription:self.descriptionTextField.text priorityNumber:self.priorityTextField.text.integerValue isCompletedIndicator:NO];
    
    [self.delegate didAddNewToDo:newToDo];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}





@end
