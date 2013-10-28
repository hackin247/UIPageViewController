//
//  PVCSampleViewController.m
//  PageViewController
//
//  Created by Jay Chulani on 10/26/13.
//  Copyright (c) 2013 Jay Chulani. All rights reserved.
//

#import "PVCSampleViewController.h"

@interface PVCSampleViewController () {
    UIImage *_image;
    NSUInteger _pageIndex;
}

@end

@implementation PVCSampleViewController

- (id) initWithImageName:(NSString *)imageName atIndex:(NSUInteger)index {
    if ((self = [super init])) {
        _image = [UIImage imageNamed:imageName];
        _pageIndex = index;
    }
    
    return self;
}

- (void)loadView {
    self.view = [[UIImageView alloc] initWithImage:_image];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
