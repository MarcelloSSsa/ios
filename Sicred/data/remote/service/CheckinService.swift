//
//  CheckinService.swift
//  Sicred
//
//  Created by Marcello Da Silva Sousa on 13/11/20.
//

import Foundation
import RxSwift

protocol CheckinService {
    func checkin(eventId: String, email: String, name: String) -> Single<APIResponse<Bool>>
}
