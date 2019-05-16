//
//  ImageModel.h
//  Assignmentone
//
//  Created by Jiayin  Liu on 2018/9/5.
//  Copyright © 2018 Mingze Sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageModel : NSObject

@property (strong,nonatomic) NSArray* imageNames;

+(ImageModel*) sharedInstance;

-(UIImage*)getImageWithName:(NSString*)name;

@end
