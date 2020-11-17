//
//  HTTPInterceptor.swift
//  Sicred
//
//  Created by Marcello Da Silva Sousa on 09/11/20.
//

import Foundation
import Alamofire

class HTTPInterceptor: RequestAdapter {

    init() {}

    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        let urlRequest = urlRequest
        
        return urlRequest
    }
}
