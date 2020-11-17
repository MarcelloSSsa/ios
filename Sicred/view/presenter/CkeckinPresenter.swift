//
//  CkeckinPresenter.swift
//  Sicred
//
//  Created by Marcello Da Silva Sousa on 13/11/20.
//

import Foundation
import RxSwift

class CheckinPresenter {
    private let disposeBag = DisposeBag()
    private let repository: CheckinRepository = CheckinRepository()
    
    private var checkin: Checkin?
    
    private var view: CheckinView?
    
    init(_ view: CheckinView?) {
        self.view = view
    }
    
    func checkin(eventId: String, email: String, name: String) {
        updateViewState(.UIData(true, false ,nil))
        repository.checkin(eventId: eventId, email: email, name: name)
            .observeOn(MainScheduler.instance)
            .subscribe(onSuccess: { response in
                if(response.error != nil || response.data == false) {
                    self.updateViewState(.UIData(false, false, CheckinViewState.Error.UNKNOWN))
                } else {
                    self.updateViewState(.UIData(false, true, nil))
                }
            }, onError: {error in
                self.updateViewState(.UIData(false, false, CheckinViewState.Error.UNKNOWN))
            })
            .disposed(by: disposeBag)
    }
    
    func updateViewState(_ viewState: CheckinViewState) {
        switch(viewState){
        case .UIData(let isSending, let sended, let error):
            view?.onViewStateUpdated(.UIData(isSending, sended, error))
        }
    }
}

protocol CheckinView {
    func onViewStateUpdated(_ viewState: CheckinViewState)
}

enum CheckinViewState {
    case UIData(Bool, Bool, Error?)
    
    enum Error {
        case UNKNOWN
    }
}

