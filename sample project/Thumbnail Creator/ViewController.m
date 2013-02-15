//
//  ViewController.m
//  Thumbnail Creator
//
//  Created by Adrien Grsmto on 03/01/13.
//  Copyright (c) 2013 Grsmto. All rights reserved.
//

#import "ViewController.h"

#import "UIImage+Thumbnail.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _mask = [UIImage imageNamed:@"mask.jpg"];
    
    UIImage *rawImage = [UIImage imageNamed:@"image.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:rawImage];
    
    // Don't forget that thumbnail width  can't be smaller than mask width
    
    // Thumbnail with width, no mask
    UIImage *thumbnail = [UIImage createThumbnailFromFile:@"image.jpg" withWidth:300];
    UIImageView *thumbnailView = [[UIImageView alloc] initWithImage:thumbnail];
    thumbnailView.frame = CGRectMake(0, imageView.frame.size.height+20, thumbnailView.frame.size.width, thumbnailView.frame.size.height);
    
    // Thumbnail with height, no mask
    UIImage *thumbnailHeight = [UIImage createThumbnailFromFile:@"image.jpg" withHeight:150];
    UIImageView *thumbnailHeightView = [[UIImageView alloc] initWithImage:thumbnailHeight];
    thumbnailHeightView.frame = CGRectMake(0, imageView.frame.size.height+thumbnailView.frame.size.height+40, thumbnailHeightView.frame.size.width, thumbnailHeightView.frame.size.height);
    
    // Thumbnail with width+mask
    UIImage *thumbnailMask = [UIImage createThumbnailFromFile:@"image.jpg" withWidth:300 usingMask:_mask];
    UIImageView *thumbnailMaskView = [[UIImageView alloc] initWithImage:thumbnailMask];
    thumbnailMaskView.frame = CGRectMake(thumbnailView.frame.size.width+20, imageView.frame.size.height+20, thumbnailMaskView.frame.size.width, thumbnailMaskView.frame.size.height);
    
    // Thumbnail with weight+mask
    UIImage *thumbnailHeightMask = [UIImage createThumbnailFromFile:@"image.jpg" withHeight:250 usingMask:_mask];
    UIImageView *thumbnailHeightMaskView = [[UIImageView alloc] initWithImage:thumbnailHeightMask];
    thumbnailHeightMaskView.frame = CGRectMake(thumbnailView.frame.size.width+20, imageView.frame.size.height+thumbnailMaskView.frame.size.height+40, thumbnailHeightMaskView.frame.size.width, thumbnailHeightMaskView.frame.size.height);
    
    [self.view addSubview:thumbnailView];
    [self.view addSubview:thumbnailHeightView];
    [self.view addSubview:thumbnailMaskView];
    [self.view addSubview:thumbnailHeightMaskView];
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
