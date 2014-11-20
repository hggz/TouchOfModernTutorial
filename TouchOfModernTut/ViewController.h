//
//  ViewController.h
//  TouchOfModernTut
//
//  Created by Hugo on 11/19/14.
//  Copyright (c) 2014 Hugo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *passTF;
@property (weak, nonatomic) IBOutlet UITextField *emailTF;
@property (weak, nonatomic) IBOutlet UIButton *continueButton;
@property (weak, nonatomic) IBOutlet UIView *orLeft;
@property (weak, nonatomic) IBOutlet UIView *orRight;
@property (weak, nonatomic) IBOutlet UILabel *orLabel;
- (IBAction)continueAction:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *fbLogin;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end

