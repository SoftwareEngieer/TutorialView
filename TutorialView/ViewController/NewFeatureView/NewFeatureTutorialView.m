//
//  NewFeatureTutorialView.m
//  Markafoni
//
//  Created by Omer Aktuna on 6/3/14.
//  Copyright (c) 2014 Omer Aktuna. All rights reserved.
//

#import "NewFeatureTutorialView.h"

@implementation NewFeatureTutorialView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)showWithImages:(NSArray *)imagesArray {
    [self setBackgroundColor:[UIColor blackColor]];
    if(imagesArray != nil){
        pageCount = [imagesArray count];
        newFeatureTutorialScroll = [[UIScrollView alloc]init];
        [newFeatureTutorialScroll setFrame:CGRectMake(0.0f, 0.0f, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
        [newFeatureTutorialScroll setBackgroundColor:[UIColor clearColor]];
        newFeatureTutorialScroll.pagingEnabled = YES;
        newFeatureTutorialScroll.scrollEnabled = YES;
        newFeatureTutorialScroll.delegate = self;
        newFeatureTutorialScroll.showsHorizontalScrollIndicator = NO;
        newFeatureTutorialScroll.showsVerticalScrollIndicator = NO;
        newFeatureTutorialScroll.contentSize = CGSizeMake((([[UIScreen mainScreen] bounds].size.width) * ([imagesArray count])), [[UIScreen mainScreen] bounds].size.height);
        
        for (int i = 0; i < [imagesArray count]; i++) {
            UIImageView *image_View  = [[UIImageView alloc]initWithFrame:CGRectMake(i * [[UIScreen mainScreen] bounds].size.width, 0.0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
            [image_View setImage:[imagesArray objectAtIndex:i]];
            [newFeatureTutorialScroll addSubview:image_View];
        }
        
        pageControl=[[PageControl alloc]initWithFrame:CGRectMake(0.0f, [[UIScreen mainScreen] bounds].size.height - 15.0, [[UIScreen mainScreen] bounds].size.width, 10.0f)];
        [pageControl setUserInteractionEnabled:NO];
        [pageControl setCurrentPage:1];
        [pageControl setNumberOfPages:[imagesArray count]];
        
        skipButton = [[UIButton alloc] initWithFrame:CGRectMake(newFeatureTutorialScroll.frame.size.width - 65.0,pageControl.frame.origin.y - ((17.0 - pageControl.frame.size.height)/2), 80.0, 17.0)];
        [skipButton setTitle:NSLocalizedString(@"SKIP", nil) forState:UIControlStateNormal];
        [skipButton addTarget:self action:@selector(skipIntroduction) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:newFeatureTutorialScroll];
        [self addSubview:pageControl];
        [self addSubview:skipButton];
        
        self.alpha = 0;
        [[[UIApplication sharedApplication] keyWindow] addSubview:self];
        
        [UIView animateWithDuration:0.5 animations:^{
            self.alpha = 0.6;
        } completion:^(BOOL finished) {
            
        }];
    }
}

- (void)skipIntroduction {
    [self hideWithFadeOutDuration:0.5];
}

- (void)hideWithFadeOutDuration:(CGFloat)duration {
    [UIView animateWithDuration:duration animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished){
		[self finishIntroduction];
	}];
}

- (void)finishIntroduction {
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)0);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self removeFromSuperview];
        if([self.delegate respondsToSelector:@selector(newFeatureTutorialFinished)]) {
            [self.delegate newFeatureTutorialFinished];
        }
    });
}

#pragma mark - ScrollView delegate methods
- (void)scrollViewDidScroll:(UIScrollView *)sender {
    // Switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = newFeatureTutorialScroll.frame.size.width;
    int pageNumber = floor((newFeatureTutorialScroll.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageControl.currentPage = pageNumber;
    
    if(newFeatureTutorialScroll.contentOffset.x > ((newFeatureTutorialScroll.contentSize.width) - (newFeatureTutorialScroll.bounds.size.width)) + 70) { //at last page 70 pixel scrolling slice to finish the tutorial view.
        [self skipIntroduction];
    }
}


@end
