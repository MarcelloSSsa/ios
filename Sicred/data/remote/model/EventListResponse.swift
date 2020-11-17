//
//  EventListResponse.swift
//  Sicred
//
//  Created by Marcello Da Silva Sousa on 09/11/20.
//

import Foundation

struct EventListResponse : Decodable {
    var content: [EventDTO] = []
    
    private struct _None: Decodable {}
    
    private enum CodingKeys: String, CodingKey {
        case content
    }
    
    init(content: [EventDTO]) {
        self.content = content
    }
    
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        while !container.isAtEnd {
            if let decoded = try? container.decode(EventDTO.self) {
                content.append(decoded)
            }
            else {
                // item is silently ignored.
                print("Decoder Error")
            }
        }
    }
}
