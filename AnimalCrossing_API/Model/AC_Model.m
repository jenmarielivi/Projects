//
//  AC_Model.m
//  AnimalCrossing_API
//
//  Created by Consultant on 8/8/22.
//

#import "AC_Model.h"

@implementation AC_Model


-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    
    self = [super self];
    
    if(self){
        
        self.Identifier = [dictionary valueForKey:@"id"];
        self.CatchPhrase = [dictionary valueForKey:@"catch-phrase"];
        self.ACImage = [dictionary valueForKey:@"image_uri"];
        
        NSDictionary* names = [dictionary valueForKey:@"name"];  // because there 14 different names
        self.Name = [names valueForKey:@"name-USen"];  // grab the first one
    }

    return self;
}

@end
