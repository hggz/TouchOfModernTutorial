//
//  TutorialViewController.h
//  TouchOfModernTut
//
//  Created by Hugo on 11/19/14.
//  Copyright (c) 2014 Hugo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorialViewController : UIViewController
@property (nonatomic, assign) id delegate;
@property (weak, nonatomic) IBOutlet UILabel *pageNumber;
@property (weak, nonatomic) IBOutlet UIView *tutMessageView;
@property (weak, nonatomic) IBOutlet UILabel *tutMessage;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (assign, nonatomic) NSInteger index;
@property (weak, nonatomic) IBOutlet UIButton *finishButton;
- (IBAction)finishAction:(id)sender;
@end
