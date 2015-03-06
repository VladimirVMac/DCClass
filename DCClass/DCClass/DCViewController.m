//
//  DCViewController.m
//  DCClass
//
//  Created by Дмитрий Утьманов on 26/02/15.
//  Copyright (c) 2015 cooler. All rights reserved.
//


#import "DCViewController.h"

#import "DCColor.h"


@implementation DCViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];
  self.automaticallyAdjustsScrollViewInsets = NO;
  self.edgesForExtendedLayout = UIRectEdgeNone;
  
  _rect = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self _configureView];
}

//- (void)viewDidAppear:(BOOL)animated {
//  [super viewDidAppear:animated];
//  [self _configureView];
//}

- (void)viewWillLayoutSubviews {
  [super viewWillLayoutSubviews];
  [self _configureView];
}

//- (void)viewDidLayoutSubviews {
//  [super viewDidLayoutSubviews];
//  [self _configureView];
//}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
  [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
  [self _configureView];
}

//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
//  [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
//  [self _configureView];
//}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  [self _cleanView];
}

- (void)dealloc {
  [self _cleanView];
}

#pragma mark - Layout MGMT

- (void)_configureView {
  CGRect rect = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
  if (!CGRectEqualToRect(rect, self.rect)) {
    _rect = rect;
    [self configureView];
  }
}

- (void)configureView {
  [NSException raise:NSInternalInconsistencyException format:@"You must override \"%@\" method in a \"%@\" ", NSStringFromSelector(_cmd), NSStringFromClass([self class])];
}

- (CGFloat)statusBarHeight {
  CGSize statusBarSize = [[UIApplication sharedApplication] statusBarFrame].size;
  return MIN(statusBarSize.width, statusBarSize.height);
}

- (CGFloat)heightForLabel:(UILabel *)label andWidth:(CGFloat)width {
  return [self sizeForLabel:label withMaxWidth:width].height;
}

- (CGSize)sizeForLabel:(UILabel *)label withMaxWidth:(CGFloat)width {
  return [label sizeThatFits:CGSizeMake(width, FLT_MAX)];
}

#pragma mark - Memory MGMT

- (void)_cleanView {
  if(self.isViewLoaded && self.view.window == nil) {
    [self cleanView];
    self.view = nil;
  }
}

- (void)cleanView {
  [NSException raise:NSInternalInconsistencyException format:@"You must override \"%@\" method in a \"%@\" ", NSStringFromSelector(_cmd), NSStringFromClass([self class])];
}

@end
