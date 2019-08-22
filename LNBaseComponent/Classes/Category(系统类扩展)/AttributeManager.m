//
//  AttributeManager.m
//  LNUniversalApplication
//
//  Created by 尹亚坤 on 2019/8/2.
//  Copyright © 2019 lenovo. All rights reserved.
//

#import "AttributeManager.h"

@interface AttributeManager ()
@property (nonatomic,copy)NSString *originalString;
@property (nonatomic,strong)NSMutableAttributedString *originalMutableAttributeString;

@property (nonatomic,assign)double lwordSpaceWidth;
@property (nonatomic,assign)double lspaceHeight;

@property (nonatomic,assign)NSRange rangeColorful;
@property (nonatomic,strong)UIColor *colorful;

@property (nonatomic,assign)NSTextAlignment textAlignment;


@end

@implementation AttributeManager
- (instancetype)initWithString:(NSString *)str{
    self = [super init];
    if (self){
        _originalString = str;
        _originalMutableAttributeString = [[NSMutableAttributedString alloc] initWithString:str];
        _result = _originalMutableAttributeString;
    }
    return self;
}

- (AttributeManager *(^)(double height))lineSpaceHeight{

    return ^(double value){
        self.lspaceHeight = value;
        return self;
    };
}

- (AttributeManager *(^)(double height))wordSpaceWidth{

    return ^(double value){
        self.lwordSpaceWidth = value;
        return self;
    };
}

- (AttributeManager *(^)(NSRange range,UIColor *color))partTextColorful{
    return ^(NSRange range,UIColor *color){
        self.colorful = color;
        self.rangeColorful = range;
        return self;
    };
}

- (AttributeManager *(^)(NSTextAlignment textalignment))alignment{
    return ^(NSTextAlignment alignment1){
        self.textAlignment = alignment1;
        return self;
    };
}


- (void)setLspaceHeight:(double)lspaceHeight{
    _lspaceHeight = lspaceHeight;
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lspaceHeight];
    [self.originalMutableAttributeString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.originalString length])];
}

- (void)setLwordSpaceWidth:(double)lwordSpaceWidth{
    _lwordSpaceWidth = lwordSpaceWidth;
    [self.originalMutableAttributeString addAttribute:NSKernAttributeName value:@(lwordSpaceWidth) range:NSMakeRange(0, self.originalString.length - 1)];
}

- (void)setRangeColorful:(NSRange)rangeColorful{
    _rangeColorful = rangeColorful;
    [self.originalMutableAttributeString addAttribute:NSForegroundColorAttributeName value:self.colorful range:rangeColorful];
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment{
    _textAlignment = textAlignment;
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    [self.originalMutableAttributeString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.originalString length])];
}
@end
