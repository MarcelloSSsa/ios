//
//  CheckinRepository.swift
//  Sicred
//
//  Created by Marcello Da Silva Sousa on 13/11/20.
//

import Foundation
import RxSwift

class CheckinRepository {
    
    private let service: CheckinService = ServiceLocator.shared.provideCheckinService()
    
    func checkin(eventId: String, email: String, name: String) -> Single<APIResponse<Bool>> {
        return service.checkin(eventId: eventId, email: email, name: name).map { (response) -> APIResponse<Bool> in
            if(response.error != nil){
                return APIResponse(data: false, statusCode: 200, error: nil)
            }
            return APIResponse(data: true, statusCode: 200, error: nil)
        }
    }
}
