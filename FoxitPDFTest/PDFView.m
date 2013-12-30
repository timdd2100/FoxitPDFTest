//
//  PDFView.m
//  FoxitPDFTest
//
//  Created by timkao on 13/12/30.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "PDFView.h"

@interface PDFView ()
{
    CGPDFDocumentRef pdfDocument;
    CGPDFPageRef page;
    
}

@end


@implementation PDFView
@synthesize filePath,pageNumber;

- (void)drawRect:(CGRect)rect
{
	if(filePath == nil) 	{
		pageNumber = 1;   		filePath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"pdf"];
		pdfDocument = [self GetPDFDocumentRef];
        
	}
    
    
    
	CGContextRef myContext = UIGraphicsGetCurrentContext();
    
	page = CGPDFDocumentGetPage(pdfDocument, pageNumber);
    
    CGContextSetRGBFillColor(myContext, 1.0,1.0,1.0,1.0);//背景顏色
    CGContextFillRect(myContext,rect);//填滿
    
    CGContextSaveGState(myContext);
    
    // Flip the context so that the PDF page is rendered right side up.
    //可讓pdf變正
    
    // Scale the context so that the PDF page is rendered at the correct size for the zoom level.
    CGContextTranslateCTM(myContext, 0.0, rect.size.height);
    CGContextScaleCTM(myContext, 1.0, -1.0);
    
	CGContextDrawPDFPage(myContext, page);//繪製
    CGContextRestoreGState(myContext);//
    
}

- (CGPDFDocumentRef)GetPDFDocumentRef
{
    //	CFStringRef path;
    //	CFURLRef url;
    //	CGPDFDocumentRef document;
    
    //	path = CFStringCreateWithCString(NULL, [filePath UTF8String], kCFStringEncodingUTF8);
    //    url = CFURLCreateWithFileSystemPath(NULL, path, kCFURLPOSIXPathStyle, 0);
    
    //	CFRelease(path);
    //	document = CGPDFDocumentCreateWithURL(url);
    //	CFRelease(url);
    
    NSURL *pdfURL = [[NSBundle mainBundle] URLForResource:@"test" withExtension:@"pdf"];
    
    CGPDFDocumentRef PDFDocument = CGPDFDocumentCreateWithURL((__bridge CFURLRef)pdfURL);
    
	return PDFDocument;
}

-(void)reloadView
{
	[self setNeedsDisplay]; //每次需要重画视图了，就call这个
}

-(IBAction)goUpPage:(id)sender
{
    if (pageNumber > 1) {
        pageNumber--;
        [self reloadView];
    }
}
-(IBAction)goDownPage:(id)sender
{
    
    if (pageNumber) {
        
    }
	pageNumber++;
	[self reloadView];
}


@end
