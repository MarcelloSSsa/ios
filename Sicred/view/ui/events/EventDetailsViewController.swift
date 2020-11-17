//
//  EventDetailsViewController.swift
//  Sicred
//
//  Created by Marcello Da Silva Sousa on 13/11/20.
//

import UIKit

class EventDetailsViewController: UIViewController, CheckinView {
    
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
    @IBOutlet weak var eventPrice: UILabel!
    
    var event: Event!
    private var checkin: Checkin?
    private var presenter: CheckinPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = CheckinPresenter(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        setupView()
    }
    
    private func setupView() {
        let formatter = NumberFormatter(numberStyle: .currency, locale: "pt_BR".toLocale)
        let price = event.price.format(formatter: formatter)
        eventImage.download(from: event.image)
        eventTitle.text = event.title
        eventDescription.text = event.description
        eventPrice.text = price
    }
    
    @IBAction func checkinButtonAction(_ sender: Any) {
        let alert = AlertView()
        alert.showAlert(title: "Confirme o seu ckeckin", positiveButton: "CONFIRMAR")
        alert.positiveAction = {
            let eventId = self.event.id
            let email = alert.email.text!
            let name = alert.nome.text!
            self.presenter?.checkin(eventId: eventId, email: email, name: name)
        }
    }
    
    func onViewStateUpdated(_ viewState: CheckinViewState) {
        switch(viewState){
        case .UIData(_,  _, let error):
            if(error != nil) {
                //show error View
                return
            }
        }
    }
}
