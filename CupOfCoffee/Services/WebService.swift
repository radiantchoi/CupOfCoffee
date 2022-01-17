//
//  WebService.swift
//  CupOfCoffee
//
//  Created by Gordon Choi on 2022/01/17.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case domainError
    case urlError
}

struct Resource<T: Codable> {
    let url: URL
}

class WebService {
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> Void) {
        let task = URLSession.shared.dataTask(with: resource.url) { data, response, error in
            guard let data = data,
                  error == nil
            else {
                completion(.failure(.domainError))
                return
            }
            
            let result = try? JSONDecoder().decode(T.self, from: data)
            guard let result = result
            else {
                completion(.failure(.decodingError))
                return
            }
            
            DispatchQueue.main.async {
                completion(.success(result))
            }
        }
        
        task.resume()
    }
}
