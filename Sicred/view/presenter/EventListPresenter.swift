//
//  EventListPresenter.swift
//  Sicred
//
//  Created by Marcello Da Silva Sousa on 09/11/20.
//

import Foundation
import RxSwift

class EventListPresenter {
    private let disposeBag = DisposeBag()
    private let repository: EventsRepository = EventsRepository()
    
    private var events: [Event] = []
    
    private var view: EventListView?
    
    init(_ view: EventListView?) {
        self.view = view
    }
    
    func getEvents() {
        updateViewState(.UIData(true, false, nil))
        
        repository.getEvents()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { r in
                guard r.error == nil else {
                    self.updateViewState(.UIData(false, false,r.error))
                    return
                }
                self.events = r.data!
                self.updateViewState(.ListData([]))
            }, onError: {error in
                self.updateViewState(.UIData(false, false, error))
            })
            .disposed(by: disposeBag)
    }
    
    func updateViewState(_ viewState: EventListViewState) {
        switch(viewState){
        case .UIData(let isLoading, let isRefreshing, let error):
            view?.onViewStateUpdated(.UIData(isLoading, isRefreshing, error))
        case .ListData:
            view?.onViewStateUpdated(.ListData(events))
        }
    }
}

protocol EventListView {
    func onViewStateUpdated(_ viewState: EventListViewState)
}

enum EventListViewState {
    case UIData(Bool, Bool, Error?)
    case ListData([Event])
}
