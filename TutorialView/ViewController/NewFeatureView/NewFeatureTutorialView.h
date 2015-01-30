//
//  NewFeatureTutorialView.h
//  Markafoni
//
//  Created by Omer Aktuna on 6/3/14.
//  Copyright (c) 2014 Markafoni. All rights reserved.
//

#import "PageControl.h"

@protocol NewFeatureTutorialViewDelegate <NSObject>

- (void) newFeatureTutorialFinished;

@end

@interface NewFeatureTutorialView : UIView<UIScrollViewDelegate> {
    UIScrollView *newFeatureTutorialScroll;
    PageControl *pageControl;
    UIButton *skipButton;
    NSInteger pageCount;
}

@property (nonatomic, strong) id <NewFeatureTutorialViewDelegate> delegate;

- (void)showWithImages:(NSArray *)imagesArray;

@end
