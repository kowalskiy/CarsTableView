//
//  CarDetailsCell.swift
//  Cars TableView
//
//  Created by Kacper Kowalski on 03.07.2017.
//  Copyright © 2017 Kacper Kowalski. All rights reserved.
//

import UIKit

class CarDetailsCell: UITableViewCell {
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var engineSizeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        }
    
    func configureCell(car: Car) {
        brandLabel.text = car.brand
        modelLabel.text = car.model
        engineSizeLabel.text = car.engine
    }
}

