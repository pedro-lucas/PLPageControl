//
//  PLPageControl.h
//  Pager
//
//  Created by Pedro on 8/13/14.
//
//

#import <UIKit/UIKit.h>

@interface PLPageControl : UIControl

@property(nonatomic, strong) UIColor *colorActive;
@property(nonatomic, strong) UIColor *colorInactive;

@property(nonatomic, assign) NSInteger numberOfPages;
@property(nonatomic, assign) NSInteger currentPage;

@end
