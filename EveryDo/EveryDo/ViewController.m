//
//  ViewController.m
//  EveryDo
//
//  Created by Kyla  on 2018-08-14.
//  Copyright © 2018 Kyla . All rights reserved.
//

#import "ViewController.h"
#import "ToDo.h"
#import "TableViewCell.h"
#import "DetailViewController.h"
#import "ToDoViewController.h"


@interface ViewController () <UITableViewDataSource,UITableViewDelegate, AddNewToDoDelegate>


@property (nonatomic, strong) NSMutableArray<ToDo*> *toDoListArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) UISwipeGestureRecognizer *recognizer;

//@property (nonatomic, strong) NSArray<NSString*> *sectionTitles;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ////array filling
//    self.toDoListItems = @[@[@"Grocery Shopping", @"Read a Book", @"Buy a Car", @"Buy a House", @"Go to Space"],@[@"Watch Mamma-Mia 2 Here We Go Again", @"Get Revenge", @"Have a Baby", @"Tickle Elmo",]];

//    ToDo *item1 = [[ToDo alloc] initWithToDoTitle:@"Grocery Shopping" toDoDescription:@"Lllllllllll" priorityNumber:1 isCompletedIndicator:NO];
//    ToDo *item2 = [[ToDo alloc] initWithToDoTitle:@"Read a Book" toDoDescription:@"ffffffffffffff" priorityNumber:2 isCompletedIndicator:NO];
//    ToDo *item3 = [[ToDo alloc] initWithToDoTitle:@"Buy a Car" toDoDescription:@"ffffffffffffff" priorityNumber:3 isCompletedIndicator:NO];
//    ToDo *item4 = [[ToDo alloc] initWithToDoTitle:@"Buy a House" toDoDescription:@"ffffffffffffff" priorityNumber:4 isCompletedIndicator:NO];
//    ToDo *item5 = [[ToDo alloc] initWithToDoTitle:@"Go to Space" toDoDescription:@"ffffffffffffff" priorityNumber:5 isCompletedIndicator:NO];
//    ToDo *item6 = [[ToDo alloc] initWithToDoTitle:@"Get Revenge" toDoDescription:@"ffffffffffffff" priorityNumber:6 isCompletedIndicator:NO];
//    ToDo *item7 = [[ToDo alloc] initWithToDoTitle:@"Watch Mamma Mia" toDoDescription:@"ffffffffffffff" priorityNumber:7 isCompletedIndicator:NO];
//    self.toDoListArray = @[item1, item2, item3, item4, item5, item6, item7];
    
    self.toDoListArray = [@[[[ToDo alloc] initWithToDoTitle:@"Grocery Shopping" toDoDescription:@"LALALALALA" priorityNumber:1 isCompletedIndicator:NO],
                            [[ToDo alloc] initWithToDoTitle:@"Read a Book" toDoDescription:@"HAHAHAHA" priorityNumber:2 isCompletedIndicator:NO]]
                          mutableCopy];

   
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(completeToDo:)];
    swipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.tableView addGestureRecognizer:swipeGesture];
    
    
}





#pragma mark - AddNewToDoDelegate

-(void)didAddNewToDo:(ToDo *)toDo {
    NSLog(@"did hit didaddtableview method");
    [self.toDoListArray addObject:toDo];
    [self.tableView reloadData];
    

}




#pragma mark - UITableViewDataSource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
(NSInteger)section {
    return self.toDoListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    TableViewCell *toDoListCell = [tableView dequeueReusableCellWithIdentifier:@"toDoCell" forIndexPath:indexPath];
    
    ToDo *toDoList = self.toDoListArray[indexPath.row];
    
    [toDoListCell congfigureCell:toDoList];
    return toDoListCell;
}
/////////to make completed button
-(UISwipeActionsConfiguration *)tableView:(UITableView *)tableView leadingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIContextualAction *completeAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal title:@"COMPLETED!" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler) (BOOL)) {
        
        //TOdo : complete actions here
        self.toDoListArray[indexPath.row].isCompletedIndicator = YES;
        [tableView reloadData];
    }];
    UISwipeActionsConfiguration *completeActionConfiguration = [UISwipeActionsConfiguration configurationWithActions:@[completeAction]];
    completeActionConfiguration.performsFirstActionWithFullSwipe = YES;
    return completeActionConfiguration;
}
//////////to delete row
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_toDoListArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else {
        NSLog(@"Unhandled editing style! %ld", (long)editingStyle);
    }
}

////////for header title
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *headerTitle;
    
    if (section == 0) {
        headerTitle = @"To Do Priority!";
    } else {
        headerTitle = @"To Do Whenevs!";
    }
    return headerTitle;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"addNewToDo"]) {
        ToDoViewController *dvc = segue.destinationViewController;
        dvc.delegate = self;
    }
        if ([segue.identifier isEqualToString:@"detailSegue"]) {
        DetailViewController *detailViewController = segue.destinationViewController;
        TableViewCell *toDoListCell = sender;
        detailViewController.toDoNameLabel = toDoListCell.toDoListTitle;
        detailViewController.toDoDescriptionLabel = toDoListCell.toDoDescription;
        detailViewController.toDoPriorityLabel = [NSString stringWithFormat:@"Priority: %ld", toDoListCell.toDoPriority];
        }
        
    }

////////////for footer title
//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:
//(NSInteger)section {
//    NSString *footerTitle;
//
//    if (section==0) {
//        footerTitle = @"Section 1 Footer";
//    } else {
//        footerTitle = @"Section 2 Footer";
//    }
//    return footerTitle;
//}

#pragma mark - TableView delegate

//-(UISwipeActionsConfiguration *)tableView:(UITableView *)tableView leadingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//}

-(void)completeToDo:(UISwipeGestureRecognizer *)sender {
    if (self.toDoListArray.count > 0) {
        NSLog(@"%i", self.toDoListArray.count);
        CGPoint point = [sender locationInView:self.tableView];
        NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:point];
        ToDo *objectToComplete = self.toDoListArray[indexPath.row];
        NSLog(@"%i", objectToComplete.isCompletedIndicator);
        objectToComplete.isCompletedIndicator = !objectToComplete.isCompletedIndicator;
        [self.tableView reloadData];
        NSLog(@"%i", objectToComplete.isCompletedIndicator);
    }
}





@end
