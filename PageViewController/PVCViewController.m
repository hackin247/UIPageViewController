//
//  PVCViewController.m
//  PageViewController
//
//  Created by Jay Chulani on 10/26/13.
//  Copyright (c) 2013 Jay Chulani. All rights reserved.
//

#import "PVCViewController.h"
#import "PVCSampleViewController.h"

@interface PVCViewController () {
    NSArray *_imageNames;
}

@end

@implementation PVCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _imageNames = @[@"IMG_1.PNG", @"IMG_2.PNG", @"IMG_3.PNG"];
    
    
    self.dataSource = self;
    [self setViewControllers:@[
                               [[PVCSampleViewController alloc] initWithImageName:_imageNames[0] atIndex:0]]
                   direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
        
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(PVCSampleViewController *)viewController {
    if (viewController.pageIndex == [_imageNames count] -1) {
        return nil;
    } else {
        return [[PVCSampleViewController alloc] initWithImageName:_imageNames[viewController.pageIndex+1] atIndex:viewController.pageIndex+1];
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(PVCSampleViewController *)viewController {
    if (viewController.pageIndex == 0) {
        return nil;
    } else {
        return [[PVCSampleViewController alloc] initWithImageName:_imageNames[viewController.pageIndex-1] atIndex:viewController.pageIndex-1];
    }
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return [_imageNames count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    PVCSampleViewController *currentController = (PVCSampleViewController *)pageViewController.viewControllers[0];
    return currentController.pageIndex;
}

@end
