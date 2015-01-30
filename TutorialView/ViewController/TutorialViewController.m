//
//  TutorialViewController.m
//  TutorialView
//
//  Created by Omer Aktuna on 6/10/14.
//  Copyright (c) 2014 Omer Aktuna. All rights reserved.
//

#import "TutorialViewController.h"

@interface TutorialViewController () {
    UIImage *newFeatureTutorialImage1;
    UIImage *newFeatureTutorialImage2;
    UIImage *newFeatureTutorialImage3;
}

@end

@implementation TutorialViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.alpha = 0;
    
    newFeatureTutorialImage1 = [UIImage imageNamed:@"bg1"];
    newFeatureTutorialImage2 = [UIImage imageNamed:@"bg2"];
    newFeatureTutorialImage3 = [UIImage imageNamed:@"bg3"];
    
    [self.lblWelcome setFrame:CGRectMake((([UIScreen mainScreen].bounds.size.width - self.lblWelcome.frame.size.width) / 2.0), (([UIScreen mainScreen].bounds.size.height - self.lblWelcome.frame.size.height) / 2.0),self.lblWelcome.frame.size.width,self.lblWelcome.frame.size.height)];
    
    NewFeatureTutorialView *newFeatureTutorialView = [[NewFeatureTutorialView alloc]initWithFrame:CGRectMake(0.0, 0.0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    newFeatureTutorialView.delegate = self;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.view.alpha = 1;
    } completion:^(BOOL finished) {
        [self.view addSubview:newFeatureTutorialView];
        
        [newFeatureTutorialView showWithImages:[NSArray arrayWithObjects:newFeatureTutorialImage1,newFeatureTutorialImage2,newFeatureTutorialImage3,nil]];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - NewFeatureTutorialViewDelegate Methods
- (void)newFeatureTutorialFinished {
    NSLog(@"finished...");
}

@end
