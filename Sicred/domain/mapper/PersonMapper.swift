//
//  PersonMapper.swift
//  Sicred
//
//  Created by Marcello Da Silva Sousa on 10/11/20.
//

import Foundation

class PersonMapper: Mapper {
    typealias D = PersonDTO
    typealias E = Person
    
    func toEntity(dto: PersonDTO) -> Person {
        return Person(picture: dto.picture, name: dto.name, eventID: dto.eventID, id: dto.id)
    }
    
    func toDTO(entity: Person) -> PersonDTO? {
        return nil
    }
    
    func toEntityList(dtoList: [PersonDTO]) -> [Person] {
        return dtoList.map({ (personDTO) -> Person in
            return toEntity(dto: personDTO)
        })
    }
    
    func toDTOList(entityList: [Person]) -> [PersonDTO]? {
        return nil
    }
}
