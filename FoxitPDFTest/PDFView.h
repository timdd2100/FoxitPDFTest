//
//  PDFView.h
//  FoxitPDFTest
//
//  Created by timkao on 13/12/30.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDFView : UIScrollView<UIScrollViewDelegate>
@property (copy, nonatomic) NSString *filePath;
@property int pageNumber;

-(CGPDFDocumentRef)GetPDFDocumentRef;

-(void)reloadView;
-(IBAction)goUpPage:(id)sender;
-(IBAction)goDownPage:(id)sender;

@end
