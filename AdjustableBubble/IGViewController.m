//
//  IGViewController.m
//  AdjustableBubble
//
//  Created by Admin on 21/02/13.
//  Copyright (c) 2013 Arpit Awasthi. All rights reserved.
//

#import "IGViewController.h"

@interface IGViewController ()
- (IBAction)IncreaseBadgeZero:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation IGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    [[AdjustableBubble instanse] setText:@"10"];
    [_button addSubview:[AdjustableBubble instanse]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)IncreaseBadgeZero:(id)sender {
    long value = [[AdjustableBubble instanse].text intValue];
    value *= 10;
    [[AdjustableBubble instanse] setBadgeCount:value];
}
@end
