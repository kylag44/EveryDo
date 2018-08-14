//
//  ToDoViewController.h
//  EveryDo
//
//  Created by Kyla  on 2018-08-14.
//  Copyright © 2018 Kyla . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

/////add protocol for adding new to do item and make sure import todo class as well
@protocol AddNewToDoDelegate
-(void)didAddNewToDo:(ToDo *)toDo;
@end


@interface ToDoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *priorityTextField;

@property (nonatomic, strong) NSString *nameText;
@property (nonatomic, strong) NSString *descriptionText;
@property (nonatomic, strong) NSString *priorityText;

////protocol method add delegate
@property (nonatomic, weak) id<AddNewToDoDelegate> delegate;



@end
