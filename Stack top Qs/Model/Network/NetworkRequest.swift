//
//  NetworkRequest.swift
//  Stack top Qs
//
//  Created by Илья Ильин on 22.10.2021.
//

import Foundation
import UIKit

// MARK: - NetworkRequest

protocol NetworkRequest: AnyObject {
    associatedtype ModelType
    func decode(_ data: Data) -> ModelType?
    func execute(withCompletion completion: @escaping (ModelType?, NetworkError?) -> Void)
}

extension NetworkRequest {
    fileprivate func load(_ url: URL, withCompletion completion: @escaping (ModelType?, NetworkError?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) -> Void in
            if let error = error {
                DispatchQueue.main.async {
                    completion(nil, NetworkError(kind: .requestError, description: error.localizedDescription))
                }
                return
            }
            
            if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                DispatchQueue.main.async {
                    completion(nil, NetworkError(kind: .requestError, description: "statucCode: \(response.statusCode)"))
                }
                return
            }
            
            guard let data = data, let value = self?.decode(data) else {
                DispatchQueue.main.async {
                    completion(nil, NetworkError(kind: .parseError))
                }
                return
            }
            
            DispatchQueue.main.async { completion(value, nil) }
        }
        task.resume()
    }
}

struct Wrapper<T: Decodable>: Decodable {
    let items: [T]
}

// MARK: - ImageRequest

class ImageRequest {
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
}

extension ImageRequest: NetworkRequest {
    func decode(_ data: Data) -> UIImage? {
        return UIImage(data: data)
    }
    
    func execute(withCompletion completion: @escaping (UIImage?, NetworkError?) -> Void) {
        load(url, withCompletion: completion)
    }
}

// MARK: - APIRequest

class APIRequest<Resource: APIResource> {
    let resource: Resource
    
    init(resource: Resource) {
        self.resource = resource
    }
}

extension APIRequest: NetworkRequest {
    func decode(_ data: Data) -> [Resource.ModelType]? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        let wrapper = try? decoder.decode(Wrapper<Resource.ModelType>.self, from: data)
        return wrapper?.items
    }
    
    func execute(withCompletion completion: @escaping (Array<Resource.ModelType>?, NetworkError?) -> Void) {
        load(resource.url, withCompletion: completion)
    }
}
