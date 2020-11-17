//
//  EventsRepository.swift
//  Sicred
//
//  Created by Marcello Da Silva Sousa on 09/11/20.
//

import Foundation
import RxSwift

class EventsRepository {
    
    private let service: EventService = ServiceLocator.shared.provideEventService()
    
    func getEvents() -> Observable<APIResponse<[Event]>> {
        return service.getEvents().map { (response) -> APIResponse<[Event]> in
            if let data = response.data {
                let eventList = EventMapper().toEntityList(dtoList: data.content)
                return APIResponse(data: eventList, statusCode: response.statusCode, error: response.error)
            }
            
            return APIResponse(data: nil, statusCode: response.statusCode, error: response.error)
        }
    }
}
