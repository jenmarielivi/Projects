//
//  NetworkError.swift
//  tab_bar_practice
//
//  Created by Consultant on 7/23/22.
//

import Foundation

enum NetworkError: Error{
    
    case urlFailure
    case dataFailure
    case serverResponse(Int)
    case decodeError(Error)
    case other(Error)
    
    
}


extension NetworkError: LocalizedError{
    
    public var errorDescription: String?{
        
        switch self{
        case .urlFailure:
            return NSLocalizedString("The url is not correct", comment: "URL failure")
        
        case .dataFailure:
            return NSLocalizedString("The data is corrupted", comment: "Data failure")
        
        case .decodeError:
            return NSLocalizedString("Data was fetched but failed to serialize", comment: "Decode Error")
        
        case .serverResponse(let statusCode):
            return NSLocalizedString("Server could not be reached: \(statusCode)", comment: "Server failure")
        
        case .other:
            return NSLocalizedString("Unknown Error", comment: "Other")
        }
        
        
        
        
    }
    
    
    
    
}
