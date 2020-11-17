//
//  APIResponse.swift
//  Sicred
//
//  Created by Marcello Da Silva Sousa on 09/11/20.
//

import Foundation

class APIResponse<T> {
    
    init(data: T? = nil, statusCode: Int, error: APIError? = nil) {
        self.data = data
        self.statusCode = statusCode
        self.error = error
    }
    
    var data: T?
    var statusCode: Int
    var error: APIError?
}
