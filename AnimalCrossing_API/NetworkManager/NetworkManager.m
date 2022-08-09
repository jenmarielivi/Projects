//
//  NetworkManager.m
//  StudioGhibli2
//
//  Created by Consultant on 8/8/22.
//

#import "NetworkManager.h"

@implementation NetworkManager


+(instancetype)sharedInstance {
    static NetworkManager* _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

-(instancetype)init {
    self = [super self];
    return self;
}

// Fetch Network

-(void)fetchAnimals:(NSInteger)pageNumber completion:(void (^)(NSArray* _Nullable))completion {

    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@", BASE_FILM_URL]];

    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completion(nil);
            return;
        }

        if (data == nil) {
            completion(nil);
            return;
        }
//        NSData* data = [[NSData alloc] initWithContentsOfFile:[self apiBaseURLString]]
        
        id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSMutableArray* items = [[NSMutableArray alloc] init];
        if ([object isKindOfClass:[NSDictionary class]]) {
            NSDictionary* dictionary = object;
            
            for (id hello in [dictionary allKeys]) { // look this up later. figure out what exactly it does and why
                NSDictionary* dict = [dictionary valueForKey:hello]; //looks at the dict..
                AC_Model* page = [[AC_Model alloc] initWithDictionary:dict];  // instantiate model
                [items addObject:page]; // added to list of items
            }
            
            NSArray* final = [[NSArray alloc] initWithArray:items];
            completion(final);
            
            return;
        }

    }] resume];

}

-(void)fetchImage:(NSString *)imageString completion:(void (^)(UIImage * _Nullable)) completion {
    
    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",  imageString]];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completion(nil);
            return;
        }
        
        if (data == nil) {
            completion(nil);
            return;
        }
        
        UIImage* image = [UIImage imageWithData:data];
        completion(image);
    }] resume];
    
}





@end
