//
//  AC_Model.h
//  AnimalCrossing_API
//
//  Created by Consultant on 8/8/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AC_Model : NSObject


@property(nonatomic, copy) NSString* Identifier;
@property(nonatomic, copy) NSString* Name; // for the image url
@property(nonatomic, copy) NSString* CatchPhrase;
@property(nonatomic, copy) NSString* ACImage;


-(instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end

NS_ASSUME_NONNULL_END
