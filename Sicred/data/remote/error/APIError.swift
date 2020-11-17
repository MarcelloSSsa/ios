//
//  APIError.swift
//  Sicred
//
//  Created by Marcello Da Silva Sousa on 09/11/20.
//

import Foundation

enum APIError: Error {
    case BadRequest
    case Unathorized
    case Forbidden
    case NotFound
    case Generic
}
