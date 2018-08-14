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


@interface ViewController () <UITableViewDataSource, AddNewToDoDelegate>


@property (nonatomic, strong) NSMutableArray<ToDo*> *toDoListArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

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








@end
