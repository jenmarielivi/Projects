//
//  NetworkManager.swift
//  LivingstonPokemonProject
//
//  Created by Consultant on 7/17/22.
//

import Foundation



class NetworkManager {
    static let shared: NetworkManager = .init()

    private let session: URLSession

    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
}

extension NetworkManager {
    
    
    func fetchPage(urlStr: String, callback: @escaping (Result<Pokemon, NetworkError>) -> Void) {
        
        guard let url = URL(string: urlStr)
        else {
            //callback(.failure(.urlFailure))
            return
        }

        self.session.dataTask(with: url) { data, response, error in
            // Check that we didn't screw up.
            if let error = error {
                callback(.failure(.other(error.localizedDescription as! Error)))
                return
            }
            
            // Check that the data isn't nil
            guard let data = data else {
                callback(.failure(.urlFailure))
                return
            }
        
            // Check that the response is an HTTP response
            guard let httpResp = response as? HTTPURLResponse else {
                callback(.failure(.other("Not a HTTP response" as! Error)))
                return
            }
           
            
            // Make a decoder
//            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
//
            // using try - decode the data
            do {
                let page = try JSONDecoder().decode(Pokemon.self, from: data)

                callback(.success(page))
            } catch {
                callback(.failure(.decodeError(error)))
                return
            }
        }.resume() // end of getPokemonList
}
    
    func getPokemon(urlStr: String, callback: @escaping (Result<PokeList, NetworkError>) -> Void) {
        guard let url = URL(string: urlStr) else {
            callback(.failure(.urlFailure))
            return
        }
        
        let task = session.dataTask(with: url) { data, response, error in

            // Check that we didn't screw up.
            if let error = error {
                callback(.failure(.other(error)))
                return
            }

            // Check that the response is an HTTP response (i.e., web).
            // url failure note*
            guard let httpResp = response as? HTTPURLResponse else {
                callback(.failure(.urlFailure))
                return
            }

            // Check that we got the "OK" response code (~200).
            guard (200 ..< 300).contains(httpResp.statusCode) else {
                callback(.failure(.urlFailure))
                return
            }

            // Check that the data isn't nil.
            guard let data = data else {
                callback(.failure(.dataFailure))
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            // ... and try to decode that data!
            do {
                let result = try decoder.decode(PokeList.self, from: data)
                callback(.success(result))
            } catch {
                callback(.failure(.decodeError(error)))
                return
            }
        }
        task.resume()
    }
    
    func fetchImageData(urlStr: String, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        
        guard let url = URL(string: urlStr) else {
            return
        }

        self.session.dataTask(with: url) { data, response, error in

            guard let data = data else {
                return
            }
            
            completion(.success(data))

        }.resume()
    } // end of fetchImageData





} // end of ext NetworkManager


