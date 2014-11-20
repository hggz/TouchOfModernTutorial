//
//  TutorialViewController.m
//  TouchOfModernTut
//
//  Created by Hugo on 11/19/14.
//  Copyright (c) 2014 Hugo. All rights reserved.
//

#import "TutorialViewController.h"
#import "TutorialParentViewController.h"

@interface TutorialViewController (){
}
@end

@implementation TutorialViewController
@synthesize index=_index;
@synthesize pageNumber=_pageNumber;
@synthesize tutMessage=_tutMessage;
@synthesize tutMessageView=_tutMessageView;
@synthesize backgroundImage=_backgroundImage;
@synthesize finishButton=_finishButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _tutMessageView.layer.cornerRadius=4;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self contentHandler:self.index];
}
-(void)contentHandler:(NSInteger)index{
    NSString* message = @"";
    NSString* image = @"";
    float red=0,green=0,blue=0;
    switch (index) {
        case 0: red=155/255.00;green=164/255.00;blue=149/255.00;
                message=@"Browse through a list of extraordinary vendors at unbeatable members-only pricing!";
                image=@"tutpage1.PNG";
                break;
        case 1: red=69/255.00;green=140/255.00;blue=140/255.00;
                message=@"View detailed product information for items in a variety of flavors!";
                image=@"tutpage2.png";
                break;
        case 2: red=88/255.00;green=89/255.00;blue=66/255.00;
                message=@"Sales go by fast! You have up to 15 minutes to complete your purchase(s) each time you add an item to your cart, before your cart expires!";
                image=@"tutpage3.png";
                break;
        case 3: red=26/255.00;green=48/255.00;blue=40/255.00;
                message=@"Don't forget to checkout our Holiday Store menu item to view ths hottest products of the season!";
                image=@"tutpage4.png";
                break;
        case 4: red=190/255.00;green=182/255.00;blue=242/255.00;
                message=@"Each friend you invite gets $10 credit immediately and you get $20 credit when their first order ships!";
                image=@"tutpage5.png";
                break;
        default:
            break;
    }
    
    
    [_backgroundImage setImage:[UIImage imageNamed:image]];
    [_tutMessage setText:message];
    [_tutMessage sizeToFit];
    [_tutMessageView setBackgroundColor:[UIColor colorWithRed:red green:green blue:blue alpha:0.8]];
    
    if(index!=4)[_finishButton setHidden:YES];
    else [_finishButton setHidden:NO];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)finishAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(finishedTutorial)])[self.delegate finishedTutorial];
}
@end
