//
//  PVCPagesViewController.m
//  PageViewController
//
//  Created by Jay Chulani on 10/26/13.
//  Copyright (c) 2013 Jay Chulani. All rights reserved.
//

#import "PVCPagesViewController.h"

@interface PVCPagesViewController () {
    NSArray *pages;
}

@property (retain, nonatomic) NSArray *pages;
@property (strong, nonatomic) UIPageViewController *pageController;


@end

@implementation PVCPagesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIViewController *page1 = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"page1"];

    UIViewController *page2 = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"page2"];

    UIViewController *page3 = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"page3"];

    UIViewController *page4 = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"page4"];

    self.pages = [[NSArray alloc] initWithObjects:page1, page2, page3, page4, nil];

    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    [self.pageController setDelegate:self];
    [self.pageController setDataSource:self];

    [[self.pageController view] setFrame:[[self view] bounds]];
    NSArray *viewControllers = [NSArray arrayWithObject:[self.pages objectAtIndex:0]];
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];

    [self addChildViewController:self.pageController];
    
    
    [self.view addSubview:self.pageControl];
    
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
    [self.view sendSubviewToBack:[self.pageController view]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    for (NSUInteger i = 0; i < self.pages.count; i++) {
        if ([viewController isEqual:[self.pages objectAtIndex:i]]) {
            if (i < [self.pages count]-1) {
                return [self.pages objectAtIndex:i+1];
            } else {
                return nil;
            }
        }
    }

    return nil;
}


- (UIViewController *)
pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {

    for (NSUInteger i = 0; i < self.pages.count; i++) {
        if ([viewController isEqual:[self.pages objectAtIndex:i]]) {
            if (i > 0) {
                return [self.pages objectAtIndex:i-1];
            } else {
                return nil;
            }
        }
    }
    
    return nil;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return [self.pages count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    PVCPagesViewController *currentController = (PVCPagesViewController *)pageViewController.viewControllers[0];
    
    for (NSUInteger i = 0; i < self.pages.count; i++) {
        if ([currentController isEqual:[self.pages objectAtIndex:i]]) {
            return i;
        }
    }
    
    return 0;
}

@end
