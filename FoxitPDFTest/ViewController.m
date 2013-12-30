//
//  ViewController.m
//  FoxitPDFTest
//
//  Created by timkao on 13/12/30.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "ViewController.h"
#import "PDFView.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize PDFScrollView;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    PDFView *testPDF = [PDFView new];
    PDFScrollView.backgroundColor = [UIColor whiteColor];
    
    [testPDF drawRect:PDFScrollView.frame];
   
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
