//
//  NetworkError.swift
//  Stack top Qs
//
//  Created by Илья Ильин on 23.10.2021.
//

import Foundation

struct NetworkError: Error {
    enum ErrorKind {
        case parseError
        case requestError
    }
    
    let kind: ErrorKind
    var description: String?
    
    init(kind: ErrorKind) {
        self.kind = kind
    }
    
    init(kind: ErrorKind, description: String) {
        self.kind = kind
        self.description = description
    }
}
