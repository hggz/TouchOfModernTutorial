//
//  ViewController.m
//  TouchOfModernTut
//
//  Created by Hugo on 11/19/14.
//  Copyright (c) 2014 Hugo. All rights reserved.
//

#import "ViewController.h"
#import "TutorialViewController.h"
#import "TutorialParentViewController.h"
#import "BodyViewController.h"
@interface ViewController (){
    
    NSInteger op;
    
    CGRect screenRect;
    CGFloat screenWidth;
    CGFloat screenHeight;
}

@end
@implementation ViewController
@synthesize passTF=_passTF;
@synthesize emailTF=_emailTF;
@synthesize continueButton=_continueButton;
@synthesize orLabel=_orLabel;
@synthesize orLeft=_orLeft;
@synthesize orRight=_orRight;
@synthesize fbLogin=_fbLogin;
@synthesize titleLabel=_titleLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    op=0;
    screenRect=[[UIScreen mainScreen]bounds];
    screenWidth=screenRect.size.width;
    screenHeight=screenRect.size.height;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    [_passTF setHidden:YES];
    [self positionElements];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)dismissKeyboard{
    [_emailTF resignFirstResponder];
    [_passTF resignFirstResponder];
}
/**
 @discussion Positions ui elements relative to the location of the 'or' label!
 */
-(void)positionElements{
    _orLabel.center = CGPointMake(screenWidth/2, screenHeight/2);
    _orRight.center = CGPointMake(_orLabel.center.x+_orLabel.frame.size.width*2, _orLabel.center.y);
    _orLeft.center = CGPointMake(_orLabel.center.x-_orLabel.frame.size.width*2, _orLabel.center.y);
    _fbLogin.center = CGPointMake(screenWidth/2, _orLabel.center.y+_orLabel.frame.size.width);
    _continueButton.center = CGPointMake(screenWidth/2, _orLabel.center.y-_orLabel.frame.size.width*1.5);
    _emailTF.center = CGPointMake(screenWidth/2, _continueButton.center.y-_continueButton.frame.size.height*2);
    _passTF.center = _emailTF.center;
    
    _titleLabel.center = CGPointMake(screenWidth/2, _orLabel.center.y-_orLabel.frame.size.width*4.5);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 @discussion Obviously write a check for a properly formatted and non existant email
 */
- (IBAction)continueAction:(id)sender {
    if(op==0)
    if(_emailTF.text.length>0){
     [self animateValidEmail];
        op=1;
    }
    if(op==1)
        if(_passTF.text.length>0)[self.navigationController pushViewController:[[BodyViewController alloc] initWithNibName:@"BodyViewController" bundle:nil] animated:YES];
}
-(void)animateValidEmail{
    [_passTF setHidden:NO];
    CGPoint point0 = _passTF.layer.position;
    CGPoint point1 = { point0.x, point0.y+_emailTF.frame.size.height+10 };
    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position.y"];
    anim.fromValue    = @(point0.y);
    anim.toValue  = @(point1.y);
    anim.duration   = 1.0f;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    _passTF.layer.position = point1;
    [_passTF.layer  addAnimation:anim forKey:@"position.y"];
    
    CGPoint point2 = _continueButton.layer.position;
    CGPoint point3 = { point2.x, point2.y+_emailTF.frame.size.height };
    
    CABasicAnimation *anim2 = [CABasicAnimation animationWithKeyPath:@"position.y"];
    anim2.fromValue    = @(point2.y);
    anim2.toValue  = @(point3.y);
    anim2.duration   = 1.0f;
    anim2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    _continueButton.layer.position = point3;
    [_continueButton.layer  addAnimation:anim2 forKey:@"position.y"];
    
    [UIView animateWithDuration:1.0 animations:^{
        float red=31.0/255.00,green=179.0/255.00,blue=222.0/255.00;
        [_titleLabel setTextColor:[UIColor colorWithRed:red green:green blue:blue alpha:1.0f]];
        [_continueButton setTitle:@"Register" forState:UIControlStateNormal];
    }];
}
@end