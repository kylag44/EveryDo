//
//  DetailViewController.h
//  EveryDo
//
//  Created by Kyla  on 2018-08-14.
//  Copyright © 2018 Kyla . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabe;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
///////////add the label outlets and properties for the labels as well
@property (nonatomic, strong) NSString *toDoNameLabel;
@property (nonatomic, strong) NSString *toDoDescriptionLabel;
@property (nonatomic, strong) NSString *toDoPriorityLabel;

@end
