//
//  AbstractMapper.swift
//  Sicred
//
//  Created by Marcello Da Silva Sousa on 09/11/20.
//

import Foundation

internal protocol Mapper {
    associatedtype E
    associatedtype D
    
    func toEntity(dto:D) -> E
    func toDTO(entity:E) -> D?
    
    func toEntityList(dtoList: [D]) -> [E]
    func toDTOList(entityList: [E]) -> [D]?
}
