//
//  EventServiceImpl.swift
//  Sicred
//
//  Created by Marcello Da Silva Sousa on 09/11/20.
//

import Foundation
import RxSwift
import Alamofire

class EventServiceImpl: EventService {
    func getEvents() -> Observable<APIResponse<EventListResponse>> {
        let request = APIRequestBuilder()
            .path(API.events)
            .method(.get)
            .encoding(URLEncoding(destination: .queryString, arrayEncoding: .noBrackets, boolEncoding: .numeric))
            .build()
        
        return APIClient.request(url: request)
    }
}
