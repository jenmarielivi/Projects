//
//  NetworkManager.h
//  AnimalCrossing_API
//
//  Created by Consultant on 8/8/22.
//


#define BASE_FILM_URL @"https://acnhapi.com/v1/sea/"
//#define BASE_IMAGE_URL @"https://image.tmdb.org/t/p/w500/"

#import "AC_Model.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject

+(instancetype)sharedInstance;

-(void)fetchAnimals:(NSInteger)pageNumber completion:(void(^)(NSArray*)) completion; 

-(void)fetchImage:(NSString*)imageString completion:(void(^)(UIImage*)) completion;


@end

NS_ASSUME_NONNULL_END

