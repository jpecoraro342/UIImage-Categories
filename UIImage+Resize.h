//
//  UIImage+Resize.h
//  Haulbox
//
//  Created by Joseph Pecoraro on 10/2/14.
//  Copyright (c) 2014 GatorLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Resize)

+(UIImage*)imageWithImage:(UIImage*)image resizedToSize:(CGSize)size;
+(UIImage*)imageWithImage:(UIImage*)image resizedToSquareOfEdgeLength:(NSInteger)size;
-(UIImage*)resizedToSize:(CGSize)size;
-(UIImage*)resizedToSquareOfEdgeLength:(NSInteger)size;

@end