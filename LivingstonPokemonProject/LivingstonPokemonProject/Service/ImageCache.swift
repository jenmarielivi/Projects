//
//  ImageCache.swift
//  LivingstonPokemonProject
//
//  Created by Consultant on 7/19/22.
//

import Foundation

class ImageCache{
    
    static let shared = ImageCache()
    
    private let cache: NSCache<NSString, NSData>
    
    private init(){
        self.cache = NSCache<NSString, NSData>()
    }// end of init

}// end of imagecache


extension ImageCache{
    
    func setImageData(data: Data, key: String){
        let nsKey = NSString(string: key)
        let object = NSData(data: data)
        self.cache.setObject(object, forKey: nsKey)
    }
    
    
    func getImageData(key: String) -> Data?{
        let nsKey = NSString(string: key)
        guard let object = self.cache.object(forKey: nsKey) else {return nil}
        return Data(referencing: object)
        
    }
    
}
