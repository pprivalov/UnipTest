//
//  SecondViewController.swift
//  UnipTest
//
//  Created by Pavel Privalov on 13.04.2020.
//  Copyright © 2020 Павел Привалов. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet private weak var indexPathLabel: UILabel!
    
    var indexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupView()
    }

    func setupView() {
        self.indexPathLabel.text = self.indexPath?.description
    }
    
    @IBAction private func firstButtonAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func secondButtonAction(_ sender: UIButton) {
        let firstViewController = FirstViewController.instantiateFromStoryboard()
        
        self.navigationController?.viewControllers = [firstViewController]
    }
}
