#import "PTCommPodCommon.h"
#import <Foundation/Foundation.h>

@implementation PTCommPodCommon

+ (UIImage *)createImageWithBGImage:(UIImage *)useImage addMaskImage:(UIImage *)maskImage maskImageFrame:(CGRect)maskFrame labelText:(NSString *)labelText labelHeight:(CGFloat)labelHeight bottomGap:(CGFloat)bottomGap textColor:(UIColor *)textColor textBGColor:(UIColor *)bgColor {
    UIGraphicsBeginImageContextWithOptions(useImage.size ,NO, 0.0);
    [useImage drawInRect:CGRectMake(0, 0, useImage.size.width, useImage.size.height)];
    
    CGSize useSize = useImage.size;
    CGFloat left = maskFrame.origin.x;
    CGFloat top = maskFrame.origin.y;
    CGFloat width = maskFrame.size.width;
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 画圆角矩形
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(left - 2, top - 2, width + 4, width + labelHeight + 4) cornerRadius:5];
    [kPlistColor(kColorConfigInstall.Agent.agentShareBGColor) set];
    
    CGContextAddPath(ctx, path.CGPath);
    //CGContextStrokePath(ctx);
    CGContextFillPath(ctx);
    
    //四个参数为水印图片的位置
    [maskImage drawInRect:maskFrame];
    
    //四个参数为水印图片的位置
    [[self imageWithUIView:useImage width:maskFrame.size.width text:labelText fontSize:14 textColor:textColor textBGColor:bgColor] drawInRect:CGRectMake(left+10, (top + width),  width - 20, labelHeight) ];
    //如果要多个位置显示，继续drawInRect就行
    //[maskImage drawInRect:CGRectMake(0, useImage.size.height/2, useImage.size.width, useImage.size.height/2)];
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultingImage;
}

+ (UIImage*) imageWithUIView:(UIImage*)useImage width:(CGFloat)labWidth text:(NSString *)labText fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor textBGColor:(UIColor *)bgColor
{
    UILabel *lab =[[UILabel alloc] initWithFrame:CGRectMake(0, 0, labWidth - 20 , 40)];
    lab.text = labText;
    lab.font =[UIFont boldSystemFontOfSize:fontSize];
    lab.textColor = textColor;
    lab.textAlignment =NSTextAlignmentCenter;
    lab.backgroundColor = bgColor;
    [lab sizeToFit];
    
    UIGraphicsBeginImageContextWithOptions(lab.bounds.size,NO,2.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [lab.layer renderInContext:ctx];
    UIImage* tImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tImage;
}

@end
