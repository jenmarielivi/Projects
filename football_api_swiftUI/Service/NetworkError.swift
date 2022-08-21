//
//  NetworkError.swift
//  football_api_swiftUI
//
//  Created by Consultant on 8/20/22.
//

import Foundation

enum NetworkError: Error, Equatable{
    
    static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        return lhs.localizedDescription == rhs.localizedDescription
    }
    
    case badURL
    case badData
    case badServerResponse(Int)
    case decodeError(String)
    case generalError(Error)

}

extension NetworkError: LocalizedError{
    
    public var errorDescription: String?{
        switch self{
            
        case .badURL:
            return NSLocalizedString("Bad URL, could not convert input string to a URL", comment: "Bad URL")
        case .badData:
            return NSLocalizedString("Bad Data. The data was corrupted or is missing", comment: "Bad data")
        case .badServerResponse(let statusCode):
            return NSLocalizedString("The network was not successful. Received an error code", comment: "Bad Server Response")
        case .decodeError(let message):
            return NSLocalizedString("Decoding Failure. Someting is missing in the odel object or is incorrect. Decoding message: \(message)", comment: "Decoding Error. Check that your model is set up correctly")
        case .generalError(let err):
            return NSLocalizedString("General error. Unknown what the issue is. Contact your favorite iOS developer to figure it out. (Good luck", comment: "General Error. Unknown. Good luck")
        }
    }
}
