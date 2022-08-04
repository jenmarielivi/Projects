//
//  UserDefaults.swift
//  tab_bar_practice
//
//  Created by Consultant on 7/23/22.
//

import Foundation

extension UserDefaults{
    
    // place that info somewhere. sends data
    func setObject<T: Encodable>(_ object: T, key: String) {
        let encoder = JSONEncoder()
        
        do {
            let data = try encoder.encode(object)
            self.setValue(data, forKey: key)
        }
        catch {
        print(error)
        }
    }
    
    // retreive object names/info
    func getObject<T: Decodable>(for key: String) -> T?{
        guard let data = self.data(forKey: key) else {return nil}
    
    let decoder = JSONDecoder()
        
        do{
            let model = try decoder.decode(T.self, from: data)
            return model
        }catch{
            return nil
        }
    
    }
    
    
    
}
