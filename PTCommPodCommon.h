#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PTCommPodCommon : NSObject

+ (UIImage *)createImageWithBGImage:(UIImage *)useImage addMaskImage:(UIImage *)maskImage maskImageFrame:(CGRect)maskFrame labelText:(NSString *)labelText labelHeight:(CGFloat)labelHeight bottomGap:(CGFloat)bottomGap textColor:(UIColor *)textColor textBGColor:(UIColor *)bgColor;
@end

NS_ASSUME_NONNULL_END
