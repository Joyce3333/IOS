//
//  ImageModel.m
//  Assignmentone
//
//  Created by Jiayin  Liu on 2018/9/5.
//  Copyright © 2018 Mingze Sun. All rights reserved.
//

#import "ImageModel.h"

@implementation ImageModel
@synthesize imageNames = _imageNames;

-(NSArray*)imageNames{
    if(!_imageNames)
        _imageNames = @[@"Alpha",@"Christopher Robin",@"Crazy Rich Asians",@"Mission-Impossible Fallout",@"Peppermint",@"The Meg"];
    return _imageNames;
}

+(ImageModel*)sharedInstance{
    static ImageModel * _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate,^{
        _sharedInstance = [[ImageModel alloc] init];
    });
    return _sharedInstance;
}

-(UIImage*)getImageWithName:(NSString*)name{
    UIImage* image = nil;
    image = [UIImage imageNamed:name];
    return image;
}
@end
