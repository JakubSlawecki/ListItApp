//
//  ItemCell.swift
//  ListItApp
//
//  Created by Jakub Slawecki on 01.02.2018.
//  Copyright © 2018 Jakub Slawecki. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var details: UILabel!
    
    func configureCell(item: Item) {
        
        title.text = item.title
        price.text = "Price: \(item.price) PLN"
        details.text = item.details
        
    }

}
