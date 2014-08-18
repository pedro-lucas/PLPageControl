//
//  PLPageControl.m
//  Pager
//
//  Created by Pedro on 8/13/14.
//
//

#import "PLPageControl.h"

@interface PLPageControl()

@property(nonatomic, strong) UIView *activeView;
@property(nonatomic, assign) CGFloat pixelPage;
@property(nonatomic, assign) BOOL canAnimate;

@end

@implementation PLPageControl

#pragma mark - Private

- (void)calcPixelPage {
    
    if(!self.numberOfPages) {
        _currentPage = 0;
        _numberOfPages = 10;
    }
    
    [self setPixelPage:(self.frame.size.width / (float)self.numberOfPages)];
    
}

- (void)updateActiveViewFrameWithAnimation:(BOOL)animate {
    
    [self calcPixelPage];
    
    if(!self.canAnimate || !self.superview) {
        animate = NO;
    }
    
    CGRect newFrame = CGRectMake(self.currentPage * self.pixelPage, 0, self.pixelPage, self.frame.size.height);
    
    if(animate) {
        
        [UIView animateWithDuration:0.3 animations:^{
            self.activeView.frame = newFrame;
        } completion:^(BOOL finished) {
            
        }];
        
    }else{
        self.activeView.frame = newFrame;
        
    }
    
}

#pragma mark - Init

- (void)awakeFromNib {
    [self updateActiveViewFrameWithAnimation:NO];
}

- (void)__config {
    
    [self setCanAnimate:NO];
    
    [self setActiveView:[[UIView alloc] init]];
    [self.activeView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    
    if([self respondsToSelector:@selector(tintColor)]) {
        [self setColorActive:self.tintColor];
    }else{
        [self setColorActive:[UIColor colorWithRed:254./255. green:91./255. blue:12./255. alpha:1.]];
    }
    
    [self setCanAnimate:YES];
    
    [self addSubview:self.activeView];
    
    [self calcPixelPage];
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self __config];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self __config];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    if (self = [super initWithCoder:coder]) {
        [self __config];
    }
    return self;
}

#pragma mark - Override

- (void)setBounds:(CGRect)bounds {
    [super setBounds:bounds];
    [self updateActiveViewFrameWithAnimation:NO];
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self updateActiveViewFrameWithAnimation:NO];
}

- (void)setColorActive:(UIColor *)colorActive {
    self.activeView.backgroundColor = colorActive;
}

- (void)setColorInactive:(UIColor *)colorInactive {
    [super setBackgroundColor:colorInactive];
}

- (UIColor *)colorInactive {
    return self.backgroundColor;
}

- (UIColor *)colorActive {
    return self.activeView.backgroundColor;
}

- (void)setCurrentPage:(NSInteger)currentPage {
    
    _currentPage = currentPage;
    
    if(self.currentPage >= self.numberOfPages) {
        _currentPage = self.numberOfPages - 1;
    }else if(self.currentPage < 0) {
        self.currentPage = 0;
    }
    
    [self updateActiveViewFrameWithAnimation:YES];
    
}

- (void)setNumberOfPages:(NSInteger)numberOfPages {
    
    _numberOfPages = numberOfPages;
    
    if(self.numberOfPages <= self.currentPage) {
        _numberOfPages = self.currentPage + 1;
    }else if(self.numberOfPages < 1) {
        self.numberOfPages = self.currentPage + 1;
    }
    
    [self updateActiveViewFrameWithAnimation:YES];
}

#pragma mark - Events

//-(BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
//    
//    return YES;
//}
//
//- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
//    return YES;
//}
//
//- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
//    
//}

@end