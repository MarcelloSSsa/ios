//
//  APIClient.swift
//  Sicred
//
//  Created by Marcello Da Silva Sousa on 09/11/20.
//

import Foundation
import Alamofire
import RxSwift
import RxAlamofire

struct APIClient {
    
    @discardableResult
    static func request<T: Decodable>(url: URLRequestConvertible) -> Observable<APIResponse<T>> {
        let sessionManager = SessionManager.default
        sessionManager.adapter = HTTPInterceptor()
        
        return sessionManager.rx.request(urlRequest: url)
            .responseData()
            .flatMap({arg -> Observable<APIResponse<T>> in
                let jsonDecoder = JSONDecoder()
                var data: T? = nil
                    do {
                        data = try jsonDecoder.decode(T.self, from: arg.1)
                    } catch let DecodingError.dataCorrupted(context) {
                        print(context)
                    } catch let DecodingError.keyNotFound(key, context) {
                        print("Key '\(key)' not found:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch let DecodingError.valueNotFound(value, context) {
                        print("Value '\(value)' not found:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch let DecodingError.typeMismatch(type, context)  {
                        print("Type '\(type)' mismatch:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch {
                        print("error: ", error)
                    }
                
                let statusCode = arg.0.statusCode
                let apiResponse = APIResponse<T>(statusCode: statusCode)

                print("Status Code: \(statusCode)")
                print("Response: \(String(data: arg.1, encoding: .utf8)!)")

                switch(statusCode){
                case 204:
                    apiResponse.data = nil
                case 200...299:
                    apiResponse.data = data
                case 400:
                    apiResponse.error = APIError.BadRequest
                case 401:
                    apiResponse.error = APIError.Unathorized
                case 403:
                    apiResponse.error = APIError.Forbidden
                case 404:
                    apiResponse.error = APIError.NotFound
                default:
                    apiResponse.error = APIError.Generic
                }
                
                return Observable.just(apiResponse)
            })
        }
}
