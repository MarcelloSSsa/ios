//
//  PersonDTO.swift
//  Sicred
//
//  Created by Marcello Da Silva Sousa on 10/11/20.
//

import Foundation

struct PersonDTO: Decodable {
    let picture: String
    let name: String
    let eventID: String
    let id: String
}
