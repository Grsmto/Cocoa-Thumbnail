Cocoa-Thumbnail
===============

Create thumbnails from external images on iOS

If you want to be able to create thumbnails from remote images files directly on your application, instead of generating thumbnails from remote, this is for you.
It can create, for example, rounded corner thumbnails.
You will need to process to the download of the images manually (images will need to be in application cache or in bundle to use the thumbnail function).

## What it does

It generates thumbnails depending on the mask you specified (a jpg file, mask example included in the sample project). You can choose the size of the image before "masking" it. If you don't want masked thumbnail with transparency (if you want just a square image) you can avoid specify mask and you will get a jpg file instead of png (size optimisation).

## How to use it

1. Copy/paste the category "UIImage+Thumbnail" in your project. (`UIImage+Thumbnail.h` and `UIImage+Thumbnail.m`)
2. Import `UIImage+Thumbnail.h` in the class you want to use it
3. Finally use it like this : 

`UIImage *thumbnail = [UIImage createThumbnailFromFile:@"image.jpg" withWidth:300 usingMask:mask];`

## What it doesn't do

Don't you it if you want to generate tons of thumbnails. It is a heavy function so it will only fit with specifics scenarios (was usefull in my case).
