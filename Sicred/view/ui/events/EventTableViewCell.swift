//
//  EventTableViewCell.swift
//  Sicred
//
//  Created by Marcello Da Silva Sousa on 09/11/20.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    func setupCell(event: Event){
        eventImage.download(from: event.image)
        let formatter = NumberFormatter(numberStyle: .currency, locale: "pt_BR".toLocale)
        let price = event.price.format(formatter: formatter)
        titleLabel.text = event.title
        priceLabel.text = price
    }

}
