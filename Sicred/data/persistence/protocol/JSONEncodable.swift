//
//  JSONEncodable.swift
//  Sicred
//
//  Created by Marcello Da Silva Sousa on 09/11/20.
//

import Foundation

class JSONEncodable : Encodable, Decodable {
    func encode() throws -> Data? {
        return try JSONEncoder().encode(self)
    }
}
