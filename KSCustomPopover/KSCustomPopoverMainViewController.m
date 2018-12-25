//
//  KSCustomPopoverMainViewController.m
//  KSCustomPopover
//
//  Created by Krzysztof Scianski on 12.02.2012.
//  Copyright (c) 2012 Krzysztof Scianski. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.


#import "KSCustomPopoverMainViewController.h"
#import "KSCustomPopoverBackgroundView.h"

@interface KSCustomPopoverMainViewController () <UIPopoverPresentationControllerDelegate>

@end

@implementation KSCustomPopoverMainViewController

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller traitCollection:(UITraitCollection *)traitCollection {
    return UIModalPresentationNone;
}

@synthesize flipsidePopoverController = _flipsidePopoverController;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

#pragma mark - Flipside View Controller

- (void)flipsideViewControllerDidFinish:(KSCustomPopoverFlipsideViewController *)controller
{
    [self.flipsidePopoverController dismissPopoverAnimated:YES];
    self.flipsidePopoverController = nil;
}

- (IBAction)togglePopover:(id)sender
{
    KSCustomPopoverFlipsideViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"KSCustomPopoverFlipsideViewController"];
    vc.modalPresentationStyle = UIModalPresentationPopover;
    vc.popoverPresentationController.delegate = self;
    vc.popoverPresentationController.popoverBackgroundViewClass = [KSCustomPopoverBackgroundView class];
    vc.popoverPresentationController.barButtonItem = sender;
    vc.popoverPresentationController.popoverLayoutMargins = UIEdgeInsetsMake(200, 200, 200, 200);
    [self presentViewController:vc animated:YES completion:nil];
}

@end
