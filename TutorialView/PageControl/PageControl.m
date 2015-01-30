//
//  PageControl.m
//  Markafoni
//
//  Created by Omer Aktuna on 6/3/14.
//  Copyright (c) 2014 Markafoni. All rights reserved.
//

#import "PageControl.h"

// Tweak these or make them dynamic.
#define kDotDiameter 10.0
#define kDotSpacer 10.0
#define COLOR_GRAYISHBLUE [UIColor colorWithRed:128/255.0 green:130/255.0 blue:133/255.0 alpha:1]
#define COLOR_GRAY [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1]

@implementation PageControl

@synthesize dotColorCurrentPage;
@synthesize dotColorOtherPage;
@synthesize currentPage;
@synthesize numberOfPages;

- (void)setCurrentPage:(NSInteger)page
{
    currentPage = MIN(MAX(0, page), self.numberOfPages-1);
    [self setNeedsDisplay];
}

- (void)setNumberOfPages:(NSInteger)pages
{
    numberOfPages = MAX(0, pages);
    currentPage = MIN(MAX(0, self.currentPage), numberOfPages-1);
    [self setNeedsDisplay];
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        // Default colors.
        self.backgroundColor = [UIColor clearColor];
        self.dotColorCurrentPage = COLOR_GRAYISHBLUE;
        self.dotColorOtherPage = COLOR_GRAY;
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        self.dotColorCurrentPage = [UIColor purpleColor];
        self.dotColorOtherPage = [UIColor lightGrayColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetAllowsAntialiasing(context, true);
    
    CGRect currentBounds = self.bounds;
    CGFloat dotsWidth = self.numberOfPages*kDotDiameter + MAX(0, self.numberOfPages-1)*kDotSpacer;
    CGFloat x = CGRectGetMidX(currentBounds)-dotsWidth/2;
    CGFloat y = CGRectGetMidY(currentBounds)-kDotDiameter/2;
    for (int i=0; i<self.numberOfPages; i++)
    {
        CGRect circleRect = CGRectMake(x, y, kDotDiameter, kDotDiameter);
        if (i == self.currentPage)
        {
            CGContextSetFillColorWithColor(context, self.dotColorCurrentPage.CGColor);
        }
        else
        {
            CGContextSetFillColorWithColor(context, self.dotColorOtherPage.CGColor);
        }
        CGContextFillEllipseInRect(context, circleRect);
        x += kDotDiameter + kDotSpacer;
    }
}


@end
