//
//  BodyViewController.m
//  TouchOfModernTut
//
//  Created by Hugo on 11/20/14.
//  Copyright (c) 2014 Hugo. All rights reserved.
//

#import "BodyViewController.h"
#import "TutorialParentViewController.h"
#import "UIViewController+CWPopup.h"

@interface BodyViewController ()

@end

@implementation BodyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.useBlurForPopup=YES;
    // Do any additional setup after loading the view from its nib.
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    TutorialParentViewController *tut = [[TutorialParentViewController alloc] initWithNibName:@"TutorialParentViewController" bundle:nil];
    tut.delegate=self;
    [self presentPopupViewController:tut animated:YES completion:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)dismissTutorial{
    [self dismissPopupViewControllerAnimated:YES completion:nil];
}
@end