//
//  DCSideMenuViewController.h
//  DCClass
//
//  Created by Дмитрий Утьманов on 26/02/15.
//  Copyright (c) 2015 cooler. All rights reserved.
//


#import "DCViewController.h"


@interface DCSideMenuViewController : DCViewController

@property(nonatomic) CGFloat menuWidthInPercent;
//@property(nonatomic) 


- (instancetype)initWithMenuVC:(UIViewController *)menuVC contentVC:(UIViewController *)contentVC;

@end
