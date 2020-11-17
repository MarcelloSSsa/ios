//
//  ViewController.swift
//  Sicred
//
//  Created by Marcello Da Silva Sousa on 09/11/20.
//

import UIKit
import RxSwift

class EventsViewController: UIViewController, EventListView {
    @IBOutlet weak var tableView: UITableView!
    
    private var eventList: [Event] = []
    private var event: Event?
    private var presenter: EventListPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 148))
        presenter = EventListPresenter(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        presenter?.getEvents()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dvc = segue.destination as? EventDetailsViewController {
            dvc.event = event
        }
    }
    
    func onViewStateUpdated(_ viewState: EventListViewState) {
        switch(viewState){
        case .UIData(_,  _, let error):
            if(error != nil) {
                //show error View
                tableView.isHidden = true
                return
            }
            
        case .ListData(let event):
            eventList = event
            tableView.reloadData()
        }
    }
}

extension EventsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let eventCell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as? EventTableViewCell else {
            return UITableViewCell()
        }
        
        let event = eventList[indexPath.row]
        eventCell.setupCell(event: event)
        
        return eventCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.event = eventList[indexPath.row]
        let vc = UIStoryboard.init(name: "Events", bundle: Bundle.main).instantiateViewController(withIdentifier: "eventDetail") as! EventDetailsViewController
        vc.event = event
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventList.count
    }
}
