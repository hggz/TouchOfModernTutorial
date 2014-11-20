//
//  TutorialParentViewController.h
//  TouchOfModernTut
//
//  Created by Hugo on 11/19/14.
//  Copyright (c) 2014 Hugo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TutorialParentViewController : UIViewController <UIPageViewControllerDataSource>
@property (nonatomic, strong) UIPageViewController* pageViewController;
@property (nonatomic, assign) id delegate;
-(void)finishedTutorial;
@end
