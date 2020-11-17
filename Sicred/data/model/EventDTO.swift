//
//  EventDTO.swift
//  Sicred
//
//  Created by Marcello Da Silva Sousa on 09/11/20.
//

import Foundation

struct EventDTO: Decodable {
    let id: String
    let title: String
    let price: Double
    let latitude: Double
    let longitude: Double
    let image: String
    let description: String
    let date: Int
    let people: [PersonDTO]
}
