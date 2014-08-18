//
//  PLViewController.m
//  Pager
//
//  Created by Pedro on 8/13/14.
//
//

#import "PLViewController.h"
#import "PLPageControl.h"

@interface PLViewController ()

@property (weak, nonatomic) IBOutlet PLPageControl *pager;

@end

@implementation PLViewController

- (IBAction)actionNext:(UIButton *)sender {
    self.pager.currentPage++;
}

- (IBAction)actionPrevious:(UIButton *)sender {
    self.pager.currentPage--;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end