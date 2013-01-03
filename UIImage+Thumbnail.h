//
//  UIImage+Thumbnail.h
//  AmielTest
//
//  Created by Adrien Grsmto on 30/12/12.
//  Copyright (c) 2012 Amiel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (thumbnail)

+ (UIImage*)createThumbnailFromFile:(NSString*)fileName withWidth:(int)width usingMask:(UIImage*)mask;
+ (UIImage*)createThumbnailFromFile:(NSString*)fileName withWidth:(int)width;
@end
