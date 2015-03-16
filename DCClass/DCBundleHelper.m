//
//  DCBundleHelper.m
//  
//
//  Created by Дмитрий Утьманов on 12/03/15.
//
//


#import "DCBundleHelper.h"

#import "DCLog.h"


@implementation DCBundleHelper

+ (NSBundle *)bundleWithIdentifier:(NSString *)identifier {
  static NSBundle *bundle = nil;
  static dispatch_once_t predicate;
  dispatch_once(&predicate, ^{
    NSString *mainBundlePath = [[NSBundle bundleForClass:[DCBundleHelper class]] resourcePath];
    NSString *frameworkBundlePath = [mainBundlePath stringByAppendingPathComponent:kDCImageBundleKey];
    bundle = [NSBundle bundleWithPath:frameworkBundlePath];
  });
  return bundle;
}

+ (UIImage *)getImageNamed:(NSString *)imageName {
  NSString *resourcePath = [[NSBundle bundleForClass:[DCBundleHelper class]] resourcePath];
  NSString *bundlePath = [resourcePath stringByAppendingPathComponent:kDCImageBundleKey];
  NSString *imagePath = [bundlePath stringByAppendingPathComponent:imageName];
  
  if ([UIScreen instancesRespondToSelector:@selector(scale)] && (int)[[UIScreen mainScreen] scale] == 2.0) {
    NSString *path2x = [[imagePath stringByDeletingLastPathComponent] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@@2x.%@", [[imagePath lastPathComponent] stringByDeletingPathExtension], [imagePath pathExtension]]];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path2x]) {
      return [[UIImage alloc] initWithContentsOfFile:path2x];
    }
  }
  if ([UIScreen instancesRespondToSelector:@selector(scale)] && (int)[[UIScreen mainScreen] scale] == 3.0) {
    NSString *path2x = [[imagePath stringByDeletingLastPathComponent] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@@3x.%@", [[imagePath lastPathComponent] stringByDeletingPathExtension], [imagePath pathExtension]]];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path2x]) {
      return [[UIImage alloc] initWithContentsOfFile:path2x];
    }
  }
  return [[UIImage alloc] initWithContentsOfFile:imageName];
}

@end
