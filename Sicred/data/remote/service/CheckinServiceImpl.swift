//
//  CheckinServiceImpl.swift
//  Sicred
//
//  Created by Marcello Da Silva Sousa on 13/11/20.
//

import Foundation
import RxSwift
import Alamofire

class CheckinServiceImpl: CheckinService {

    func checkin(eventId: String, email: String, name: String) -> Single<APIResponse<Bool>> {
        let checkinRequest = CheckinRequest(eventId: eventId, name: name, email: email)
        let request = APIRequestBuilder()
            .path(API.checkin)
            .method(.post)
            .parameters(checkinRequest.asDictionary())
            .encoding(URLEncoding(destination: .queryString, arrayEncoding: .noBrackets, boolEncoding: .numeric))
            .build()
        
        return APIClient.request(url: request).asSingle()
    }
}
