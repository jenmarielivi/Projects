//
//  NetworkError.swift
//  LivingstonPokemonProject
//
//  Created by Consultant on 7/17/22.
//

import Foundation


enum NetworkError: Error {
    case urlFailure
    case dataFailure
    case serverResponse(Int)
    case decodeError(Error)
    case other(Error)
}


extension NetworkError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        
        // ------ checks for URL failure  ------
        case .urlFailure:
            return NSLocalizedString("The url is not correct", comment: "URL Failure")
        
        // ------ checks for data failure  ------
        case .dataFailure:
            return NSLocalizedString("The data is empty or corrupted", comment: "Data Failure")
        
        
        // ------ checks for service response error  ------
        case .serverResponse(let statusCode):
            return NSLocalizedString("Server could not be reached, status code: \(statusCode)", comment: "Server Response Failure")
        
        // ------ checks for decode error failure  ------
        case .decodeError:
            return NSLocalizedString("The data was fetched, but failed to serialize. Contact your favorite developer. They might be able to figure it out", comment: "Decode Error")
        
        // ------ if all other checks above don't fail, but something is wrong: OTHER ------
        case .other:
            return NSLocalizedString("Unknown Error. Contact support", comment: "Other type of failure. We don't know what's wrong. Good Luck")

        }
        
        
    }
    
    
}
