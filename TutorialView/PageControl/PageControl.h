//
//  PageControl.h
//  Markafoni
//
//  Created by Omer Aktuna on 6/3/14.
//  Copyright (c) 2014 Omer Aktuna. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol PageControlDelegate;

@interface PageControl : UIView
{
    
}

// Set these to control the PageControl.
@property (nonatomic) NSInteger currentPage;
@property (nonatomic) NSInteger numberOfPages;

// Customize these as well as the backgroundColor property.
@property (nonatomic, strong) UIColor *dotColorCurrentPage;
@property (nonatomic, strong) UIColor *dotColorOtherPage;


@end

