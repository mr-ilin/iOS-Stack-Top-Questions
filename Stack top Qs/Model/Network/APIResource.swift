//
//  APIResource.swift
//  Stack top Qs
//
//  Created by Илья Ильин on 22.10.2021.
//

import Foundation


protocol APIResource {
    associatedtype ModelType: Decodable
    var methodPath: String { get }
    var filter: String? { get }
}

extension APIResource {
    var url: URL {
        var components = URLComponents(string: "https://api.stackexchange.com/2.3")!
        components.path = methodPath
        components.queryItems = [
            URLQueryItem(name: "site", value: "stackoverflow"),
            URLQueryItem(name: "order", value: "desc"),
            URLQueryItem(name: "sort", value: "votes"),
            URLQueryItem(name: "tagged", value: "swiftui"),
            URLQueryItem(name: "pagesize", value: "10")
        ]
        if let filter = filter {
            components.queryItems?.append(URLQueryItem(name: "filter", value: filter))
        }
        return components.url!
    }
}

struct QuestionResource: APIResource {
    typealias ModelType = Question
    var id: Int?
    
    var methodPath: String {
        guard let id = id else {
            return "/questions"
        }
        return "/questions/\(id)"
    }
    
    var filter: String? {
        id != nil ? "!9_bDDxJY5" : nil
    }
}
