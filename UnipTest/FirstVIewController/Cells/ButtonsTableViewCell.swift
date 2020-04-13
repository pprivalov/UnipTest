//
//  ButtonsTableViewCell.swift
//  UnipTest
//
//  Created by Pavel Privalov on 13.04.2020.
//  Copyright © 2020 Павел Привалов. All rights reserved.
//

import UIKit

protocol ButtonsTableViewCellDelegate {
    func removeButtonAction()
    func pushButtonAction()
}

class ButtonsTableViewCell: UITableViewCell {

    var delegate: ButtonsTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    @IBAction private func firstButtonAction(_ sender: UIButton) {
        self.delegate?.removeButtonAction()
    }
    
    @IBAction private func secondButtonAction(_ sender: UIButton) {
        self.delegate?.pushButtonAction()
    }
}
