//
//  ViewController.m
//  BATextViewTest
//
//  Created by 博爱 on 16/3/9.
//  Copyright © 2016年 博爱之家. All rights reserved.
//

#import "ViewController.h"
#import "MMTextAttachment.h"


@interface ViewController ()<UITextViewDelegate>
{
    MMTextAttachment *attachment;
}

@property (nonatomic, strong) UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textView = [UITextView new];
    self.textView.frame = CGRectMake(0, 20, 400, 400);
    self.textView.backgroundColor = [UIColor yellowColor];
    
    [self textContent];
    
    [self.view addSubview:self.textView];
    
    
    // 这段代码解开，就是图文显示
//    NSMutableAttributedString * string = [[NSMutableAttributedString alloc] initWithString:@"Now is the time for all good developers to come to serve their country.\n\nNow is the time for all good developers to come to serve their country."  attributes:nil] ;
//    MMTextAttachment* textAttachment = [[ MMTextAttachment alloc ]initWithData:nil ofType:nil] ;
//    UIImage* smileImage = [ UIImage imageNamed:@"005.jpg"]  ;  //myemoticon image named a.jpg
//
//    textAttachment.image= smileImage ;
//    NSAttributedString * textAttachmentString = [NSAttributedString attributedStringWithAttachment:textAttachment];
//    [string insertAttributedString:textAttachmentString atIndex:0 ];
//    self.textView.attributedText = string ;

    
}

// textView各种属性设置
- (void)textContent
{
    self.textView.editable = NO;
    self.textView.textColor = [UIColor redColor];//设置textview里面的字体颜色
    self.textView.font = [UIFont fontWithName:@"Arial" size:15.0];//设置字体名字和字体大小
    self.textView.delegate = self;//设置它的委托方法
    self.textView.backgroundColor = [UIColor whiteColor];//设置它的背景颜色
    self.textView.text = @"Now is the time for all good developers to come to serve their country.\n\nNow is the time for all good developers to come to serve their country.\n\nNow is the time for all good developers to come to serve their country.\n\nNow is the time for all good developers to come to serve their country.\n\nNow is the time for all good developers to come to serve their country.\n\nNow is the time for all good developers to come to serve their country.\n\nNow is the time for all good developers to come to serve their country.\n\nNow is the time for all good developers to come to serve their country.\n\nNow is the time for all good developers to come to serve their country.\n\nNow is the time for all good developers to come to serve their country.\n\nNow is the time for all good developers to come to serve their country.\n\nNow is the time for all good developers to come to serve their country.";//设置它显示的内容

    self.textView.scrollEnabled = YES;//是否可以拖动
    self.textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;//自适应高度
    [self.textView addObserver:self forKeyPath:@"contentSize" options:(NSKeyValueObservingOptionNew) context:NULL];

}

#pragma mark - KVO
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void *)context
{
    UITextView *tv = object;
    // Center vertical alignment
    CGFloat topCorrect = ([tv bounds].size.height - [tv contentSize].height * [tv zoomScale])/2.0;
    topCorrect = ( topCorrect < 0.0 ? 0.0 : topCorrect );
    tv.contentOffset = (CGPoint){.x = 0, .y = -topCorrect};
    
    // // Bottom vertical alignment
    // CGFloat topCorrect = ([tv bounds].size.height - [tv contentSize].height);
    // topCorrect = (topCorrect <0.0 ? 0.0 : topCorrect);
    // tv.contentOffset = (CGPoint){.x = 0, .y = -topCorrect};
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
