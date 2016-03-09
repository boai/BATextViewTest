//
//  MMTextAttachment.m
//  BATextViewTest
//
//  Created by 博爱 on 16/3/9.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "MMTextAttachment.h"

@implementation MMTextAttachment

- (CGRect)attachmentBoundsForTextContainer:(NSTextContainer *)textContainer proposedLineFragment:(CGRect)lineFrag glyphPosition:(CGPoint)position characterIndex:(NSUInteger)charIndex NS_AVAILABLE_IOS(7_0)
{
    return CGRectMake( 0 , 0 , 100 , 100);
}

@end
