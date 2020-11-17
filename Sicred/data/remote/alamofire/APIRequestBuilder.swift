//
//  APIRequestBuilder.swift
//  Sicred
//
//  Created by Marcello Da Silva Sousa on 09/11/20.
//

import Foundation
import Alamofire

class APIRequestBuilder {
    
    private let SERVER_URL = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as! String
    private let BASE_URL = "/api"
    
    private var method: HTTPMethod = .get
    private var path: String = ""
    private var headers: HTTPHeaders = [
        "Content-type" : "application/json",
        "Accept" : "application/json"
    ]
    private var parameters: Parameters? = nil
    private var encoding: ParameterEncoding = JSONEncoding(options: .prettyPrinted)
    
    func method(_ method:HTTPMethod) -> APIRequestBuilder {
        self.method = method
        return self
    }
    
    func path(_ path: String) -> APIRequestBuilder {
        self.path = path
        return self
    }
    
    func headers(_ headers: HTTPHeaders) -> APIRequestBuilder {
        self.headers = headers
        return self
    }
    
    func parameters(_ parameters: Parameters) -> APIRequestBuilder {
        self.parameters = parameters
        return self
    }
    
    func encoding(_ encoding: ParameterEncoding) -> APIRequestBuilder {
        self.encoding = encoding
        return self
    }
    
    func build() -> APIRequest {
        do {
            let url = try "\(SERVER_URL)\(BASE_URL)".asURL()
            var urlRequest = URLRequest(url: url.appendingPathComponent(path))
            urlRequest.httpMethod = method.rawValue
            urlRequest.allHTTPHeaderFields = headers
            
            if let encodedRequest = try? encoding.encode(urlRequest, with: parameters) {
                urlRequest = encodedRequest
            }
            
            print("APIRequestBuilder: [\(urlRequest.httpMethod!.uppercased())] -> \(urlRequest)")
            
            return APIRequest(urlRequest: urlRequest)
        }catch {
            fatalError("Invalid URL")
        }
    }
}

struct APIRequest : URLRequestConvertible {
    let urlRequest: URLRequest
    
    func asURLRequest() throws -> URLRequest {
        return urlRequest
    }
}
