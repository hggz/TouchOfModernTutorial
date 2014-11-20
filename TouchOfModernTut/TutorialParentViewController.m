//
//  TutorialParentViewController.m
//  TouchOfModernTut
//
//  Created by Hugo on 11/19/14.
//  Copyright (c) 2014 Hugo. All rights reserved.
//

#import "TutorialParentViewController.h"
#import "TutorialViewController.h"
#import "BodyViewController.h"

@interface TutorialParentViewController ()

@end

@implementation TutorialParentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageViewController.dataSource = self;
    [[self.pageViewController view] setFrame:[[self view] bounds]];
    
    TutorialViewController *firstPage = [self viewControllerAtIndex:0];
    
    [self.pageViewController setViewControllers:[[NSArray alloc] initWithObjects:firstPage, nil] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageViewController];
    [[self view] addSubview:[self.pageViewController view]];
    [self.pageViewController didMoveToParentViewController:self];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(TutorialViewController *)viewController index];
    
    if (index == 0)return nil;
    
    index--;
    
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(TutorialViewController *)viewController index];
    
    index++;
    
    if (index == 5)return nil;
    
    return [self viewControllerAtIndex:index];
}
/**
 @discussion Creates and returns a new view controller to display on the page VC
 */
- (TutorialViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    TutorialViewController *tutView = [[TutorialViewController alloc] initWithNibName:@"TutorialViewController" bundle:nil];
    tutView.index = index;
    tutView.delegate=self;
    return tutView;
}
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return 5;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return 0;
}
-(void)finishedTutorial{
    if ([self.delegate respondsToSelector:@selector(dismissTutorial)])[self.delegate dismissTutorial];
}
@end