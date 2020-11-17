//
//  ServiceLocator.swift
//  Sicred
//
//  Created by Marcello Da Silva Sousa on 09/11/20.
//

import Foundation

class ServiceLocator {
    
    static var shared = ServiceLocator()
    
    #if MOCK
    let data = MockData()
    #endif
    
    private init() {}
    
    func provideEventService() -> EventService {
        #if MOCK
        return MockEventService()
        #endif
        return EventServiceImpl()
    }
    
    func provideCheckinService() -> CheckinService {
        #if MOCK
        return MockCheckinService()
        #endif
        return CheckinServiceImpl()
    }
}
