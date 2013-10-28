//
//  PVCSampleViewController.h
//  PageViewController
//
//  Created by Jay Chulani on 10/26/13.
//  Copyright (c) 2013 Jay Chulani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PVCSampleViewController : UIViewController

@property (nonatomic, readonly) NSUInteger pageIndex;
- (id) initWithImageName:(NSString *)imageName atIndex:(NSUInteger)index;

@end
