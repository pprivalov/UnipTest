//
//  ImageTableViewCell.swift
//  UnipTest
//
//  Created by Pavel Privalov on 13.04.2020.
//  Copyright © 2020 Павел Привалов. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet private weak var customImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func initializate(model: ImageCellModel) {
        self.customImageView.image = model.image
        self.titleLabel.text = model.title
    }
}

struct ImageCellModel {
    let image: UIImage
    let title: String
}
