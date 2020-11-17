//
//  CheckinRequest.swift
//  Sicred
//
//  Created by Marcello Da Silva Sousa on 13/11/20.
//

import Foundation

struct CheckinRequest: Encodable {
    let eventId: String
    let name: String
    let email: String
}
