//
//  EventService.swift
//  Sicred
//
//  Created by Marcello Da Silva Sousa on 09/11/20.
//

import Foundation
import RxSwift

protocol EventService {
    func getEvents() -> Observable<APIResponse<EventListResponse>>
}
