//
//  UIImage+Thumbnail.m
//  AmielTest
//
//  Created by Adrien Grsmto on 30/12/12.
//  Copyright (c) 2012 Amiel. All rights reserved.
//

#import "UIImage+Thumbnail.h"

@implementation UIImage (thumbnail)

+ (UIImage*)createThumbnailFromFile:(NSString*)fileName withWidth:(int)width usingMask:(UIImage*)mask {
    UIImage* image;
    NSString* thumbFileName;
    double scaleFactor = [UIScreen mainScreen].scale;
    
    if (scaleFactor == 2.0)
        thumbFileName = [NSString stringWithFormat:@"%@-%i@2x.png", [fileName stringByDeletingPathExtension], width];
    else
        thumbFileName = [NSString stringWithFormat:@"%@-%i.png", [fileName stringByDeletingPathExtension], width];
    
    NSString* localImageUrl = [[self getDocumentsDirectory] stringByAppendingFormat:@"/%@", thumbFileName];
    
    image = [self loadImageWithName:thumbFileName];
    
    if (image == Nil) {
        UIImage *rawImage = [self loadImageWithName:fileName];
        UIImage *resizedImage = [self imageWithImage:rawImage scaledToWidth:width];
        
        image = [self maskImage:resizedImage withMask:mask];
        
        [UIImagePNGRepresentation(image) writeToFile:[[self getDocumentsDirectory] stringByAppendingFormat:@"/%@", thumbFileName] atomically:YES];
        
        image = [UIImage imageWithContentsOfFile:localImageUrl];
    }
    
    return image;
}

+ (UIImage*)createThumbnailFromFile:(NSString*)fileName withHeight:(int)height usingMask:(UIImage*)mask {
    UIImage* image;
    NSString* thumbFileName;
    double scaleFactor = [UIScreen mainScreen].scale;
    
    if (scaleFactor == 2.0)
        thumbFileName = [NSString stringWithFormat:@"%@-%i@2x.png", [fileName stringByDeletingPathExtension], height];
    else
        thumbFileName = [NSString stringWithFormat:@"%@-%i.png", [fileName stringByDeletingPathExtension], height];
    
    NSString* localImageUrl = [[self getDocumentsDirectory] stringByAppendingFormat:@"/%@", thumbFileName];
    
    image = [self loadImageWithName:thumbFileName];
    
    if (image == Nil) {
        UIImage *rawImage = [self loadImageWithName:fileName];
        UIImage *resizedImage = [self imageWithImage:rawImage scaledToHeight:height];
        
        image = [self maskImage:resizedImage withMask:mask];
        
        [UIImagePNGRepresentation(image) writeToFile:[[self getDocumentsDirectory] stringByAppendingFormat:@"/%@", thumbFileName] atomically:YES];
        
        image = [UIImage imageWithContentsOfFile:localImageUrl];
    }
    
    return image;
}

+ (UIImage*)createThumbnailFromFile:(NSString*)fileName withWidth:(int)width {
    UIImage* image;
    NSString* thumbFileName;
    NSString* fileType = [fileName pathExtension];
    double scaleFactor = [UIScreen mainScreen].scale;
    
    if (scaleFactor == 2.0)
        thumbFileName = [NSString stringWithFormat:@"%@-%i@2x.%@", [fileName stringByDeletingPathExtension], width, fileType];
    else
        thumbFileName = [NSString stringWithFormat:@"%@-%i.%@", [fileName stringByDeletingPathExtension], width, fileType];
    
    NSString* localImageUrl = [[self getDocumentsDirectory] stringByAppendingFormat:@"/%@", thumbFileName];
    
    image = [self loadImageWithName:thumbFileName];
    
    if (image == Nil) {
        UIImage *rawImage = [self loadImageWithName:fileName];
        image = [self imageWithImage:rawImage scaledToWidth:width];
        
        if ([fileType isEqualToString:@"jpg"]) {
            [UIImageJPEGRepresentation(image, 1.0) writeToFile:[[self getDocumentsDirectory] stringByAppendingFormat:@"/%@", thumbFileName] atomically:YES];
        } else if ([fileType isEqualToString:@"jpeg"]) {
            [UIImagePNGRepresentation(image) writeToFile:[[self getDocumentsDirectory] stringByAppendingFormat:@"/%@", thumbFileName] atomically:YES];
        } else {
            [UIImagePNGRepresentation(image) writeToFile:[[self getDocumentsDirectory] stringByAppendingFormat:@"/%@", thumbFileName] atomically:YES];
        }
        
        
        image = [UIImage imageWithContentsOfFile:localImageUrl];
    }
    
    return image;
}

+ (UIImage*)createThumbnailFromFile:(NSString*)fileName withHeight:(int)height {
    UIImage* image;
    NSString* thumbFileName;
    NSString* fileType = [fileName pathExtension];
    double scaleFactor = [UIScreen mainScreen].scale;
    
    if (scaleFactor == 2.0)
        thumbFileName = [NSString stringWithFormat:@"%@-%i@2x.%@", [fileName stringByDeletingPathExtension], height, fileType];
    else
        thumbFileName = [NSString stringWithFormat:@"%@-%i.%@", [fileName stringByDeletingPathExtension], height, fileType];
    
    NSString* localImageUrl = [[self getDocumentsDirectory] stringByAppendingFormat:@"/%@", thumbFileName];
    
    image = [self loadImageWithName:thumbFileName];
    
    if (image == Nil) {
        UIImage *rawImage = [self loadImageWithName:fileName];
        image = [self imageWithImage:rawImage scaledToHeight:height];
        
        if ([fileType isEqualToString:@"jpg"]) {
            [UIImageJPEGRepresentation(image, 1.0) writeToFile:[[self getDocumentsDirectory] stringByAppendingFormat:@"/%@", thumbFileName] atomically:YES];
        } else if ([fileType isEqualToString:@"jpeg"]) {
            [UIImagePNGRepresentation(image) writeToFile:[[self getDocumentsDirectory] stringByAppendingFormat:@"/%@", thumbFileName] atomically:YES];
        } else {
            [UIImagePNGRepresentation(image) writeToFile:[[self getDocumentsDirectory] stringByAppendingFormat:@"/%@", thumbFileName] atomically:YES];
        }
        
        
        image = [UIImage imageWithContentsOfFile:localImageUrl];
    }
    
    return image;
}

+ (UIImage *)imageWithImage:(UIImage *)image scaledToWidth:(float)i_width {
    float oldWidth = image.size.width;
    
    double screenScaleFactor = [UIScreen mainScreen].scale;
    
    if (screenScaleFactor == 2.0)
        i_width = i_width*2;
    
    float scaleFactor = i_width / oldWidth;
    
    float newHeight = image.size.height * scaleFactor;
    float newWidth = oldWidth * scaleFactor;
    
    UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight));
    [image drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (UIImage *)imageWithImage:(UIImage *)image scaledToHeight:(float)i_height {
    float oldHeight = image.size.height;
    
    double screenScaleFactor = [UIScreen mainScreen].scale;
    
    if (screenScaleFactor == 2.0)
        i_height = i_height*2;
    
    float scaleFactor = i_height / oldHeight;
    
    float newWidth = image.size.width * scaleFactor;
    float newHeight = oldHeight * scaleFactor;
    
    UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight));
    [image drawInRect:CGRectMake(0, 0, newWidth, newHeight)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (UIImage*) maskImage:(UIImage *)image withMask:(UIImage *)maskImage {
    CGImageRef maskRef = maskImage.CGImage;
    
    CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(maskRef),
                                        CGImageGetHeight(maskRef),
                                        CGImageGetBitsPerComponent(maskRef),
                                        CGImageGetBitsPerPixel(maskRef),
                                        CGImageGetBytesPerRow(maskRef),
                                        CGImageGetDataProvider(maskRef), NULL, false);
    
    CGImageRef imageNoAlpha = image.CGImage;
    
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceRGB();
    
    CGFloat width = CGImageGetWidth(imageNoAlpha);
    CGFloat height = CGImageGetHeight(imageNoAlpha);
    
    CGContextRef ctxWithAlpha = CGBitmapContextCreate(nil, CGImageGetWidth(maskImage.CGImage), CGImageGetHeight(maskImage.CGImage), 8, 4*width, cs, kCGImageAlphaPremultipliedFirst);
    
    CGFloat maskHeight = CGImageGetHeight(maskImage.CGImage);
    CGFloat maskWidth = CGImageGetWidth(maskImage.CGImage);
    CGFloat imgPosX = width/2 - maskWidth/2;
    
    CGContextDrawImage(ctxWithAlpha, CGRectMake(roundf(-imgPosX), roundf(-(height/2-maskHeight/2)), width, height), imageNoAlpha);
    
    CGImageRef imageWithAlpha = CGBitmapContextCreateImage(ctxWithAlpha);
    
    CGImageRef maskedImageRef = CGImageCreateWithMask(imageWithAlpha, mask);
    UIImage *maskedImage = [UIImage imageWithCGImage:maskedImageRef];
    
    CGImageRelease(mask);
    CGImageRelease(maskedImageRef);
    CGContextRelease(ctxWithAlpha);
    CGImageRelease(imageWithAlpha);
    CGColorSpaceRelease(cs);
    
    return maskedImage;
}

+ (NSString *)getDocumentsDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

+ (UIImage*)loadImageWithName:(NSString*)fileName {
    UIImage* image= [UIImage imageNamed:fileName];
    NSString* localImageUrl = [[self getDocumentsDirectory] stringByAppendingFormat:@"/%@", fileName];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (image != Nil) {
        return image;
    }else if([fileManager fileExistsAtPath:localImageUrl]) {
        image = [UIImage imageWithContentsOfFile:localImageUrl];
    } else {
        return Nil;
    }
    
    return image;
}

@end
