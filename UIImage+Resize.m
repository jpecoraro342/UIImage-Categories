//
//  UIImage+Resize.m
//  Haulbox
//
//  Created by Joseph Pecoraro on 10/2/14.
//  Copyright (c) 2014 GatorLab. All rights reserved.
//

#import "UIImage+Resize.h"

@implementation UIImage (Resize)

+(UIImage*)imageWithImage:(UIImage*)image resizedToSize:(CGSize)size {
    return [image resizedToSize:size];
}

+(UIImage*)imageWithImage:(UIImage*)image resizedToSquareOfEdgeLength:(NSInteger)size {
    return [image resizedToSquareOfEdgeLength:size];
}

-(UIImage*)resizedToSize:(CGSize)size {
    CGSize originalImageSize = self.size;
    if (originalImageSize.width < size.width && originalImageSize.height < size.height) {
        return self;
    }
    
    //create a scale for the image based on aspect ratio, so as to not stretch the image
    float scaleRatio = MIN(size.width / originalImageSize.width, size.height / originalImageSize.height);
    
    //Determine what the size of the image will be
    CGSize finalSize;
    finalSize.width = scaleRatio*originalImageSize.width;
    finalSize.height = scaleRatio*originalImageSize.height;
    
    UIGraphicsBeginImageContextWithOptions(finalSize, NO, 1);
    [self drawInRect:CGRectMake(0, 0, finalSize.width, finalSize.height)];
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

-(UIImage*)resizedToSquareOfEdgeLength:(NSInteger)size {
    CGSize originalImageSize = self.size;
    
    //create a rect of the size for image
    CGRect newRect = CGRectMake(0, 0, size, size);
    
    //create a scale for the image based on aspect ratio, so as to not stretch the image
    float scaleRatio = MAX(newRect.size.width / originalImageSize.width, newRect.size.height / originalImageSize.height);
    UIGraphicsBeginImageContextWithOptions(newRect.size, NO, 1);
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:newRect];
    [path addClip];
    
    //create a new rect for the actual image
    CGRect finalRect;
    finalRect.size.width = scaleRatio*originalImageSize.width;
    finalRect.size.height = scaleRatio*originalImageSize.height;
    //centers the frame
    finalRect.origin.x = 0 + (newRect.size.width - finalRect.size.width)/2;
    finalRect.origin.y = 0 + (newRect.size.height - finalRect.size.height)/2;
    
    //make the image smaller
    [self drawInRect:finalRect];
    UIImage* finalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return finalImage;
}

@end
