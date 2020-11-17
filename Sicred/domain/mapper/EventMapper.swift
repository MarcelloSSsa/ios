//
//  EventMapper.swift
//  Sicred
//
//  Created by Marcello Da Silva Sousa on 09/11/20.
//

import Foundation

class EventMapper: Mapper {
    typealias D = EventDTO
    typealias E = Event
    
    func toEntity(dto: EventDTO) -> Event {
        print("DTO: \(dto)")
        return Event(id: dto.id, title: dto.title, price: dto.price, latitude: dto.latitude, longitude: dto.longitude, image: dto.image, description: dto.description, date: dto.date, people: PersonMapper().toEntityList(dtoList: dto.people))
    }
    
    func toDTO(entity: Event) -> EventDTO? {
        return nil
    }
    
    func toEntityList(dtoList: [EventDTO]) -> [Event] {
        return dtoList.map({ (eventDTO) -> Event in
            return toEntity(dto: eventDTO)
        })
    }
    
    func toDTOList(entityList: [Event]) -> [EventDTO]? {
        return nil
    }
}
