//
//  ViewController.swift
//  UnipTest
//
//  Created by Pavel Privalov on 13.04.2020.
//  Copyright © 2020 Павел Привалов. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private var imageItems: [ImageCellModel]!
    private var buttonsCellIndexPath: IndexPath?
    private var buttonsCellDeleted: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupData()
        self.setupView()
    }

    private func setupView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.tableFooterView = UIView()
        
        for type in CellTypes.allCases {
            self.tableView.register(type.nib, forCellReuseIdentifier: type.cellIdentifier)
        }
    }
    
    private func setupData() {
        guard let virusImage = UIImage(named: "virus") else {
            self.imageItems = []
            return
        }
        
        self.imageItems = [ImageCellModel(image: virusImage, title: "Hello, world!"),
                           ImageCellModel(image: virusImage, title: "Hello, world!"),
                           ImageCellModel(image: virusImage, title: "Hello, world!")]
    }
    
    private func goToSecond(indexPath: IndexPath) {
        let secondViewController = SecondViewController.instantiateFromStoryboard()
        
        secondViewController.indexPath = indexPath
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}

extension FirstViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let cellType = CellTypes(rawValue: section) else { return 0 }
        
        switch cellType {
        case .imageCell:
            return imageItems.count
        case .buttonCell:
            return self.buttonsCellDeleted ? 0 : 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellType = CellTypes(rawValue: indexPath.section) else { return UITableViewCell() }
            
        switch cellType {
        case .imageCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellTypes.imageCell.cellIdentifier) as! ImageTableViewCell
            
            cell.initializate(model: imageItems[indexPath.row])
            return cell
        case .buttonCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellTypes.buttonCell.cellIdentifier) as! ButtonsTableViewCell
            
            self.buttonsCellIndexPath = indexPath
            cell.delegate = self
            return cell
        }
    }
}

extension FirstViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cellType = CellTypes(rawValue: indexPath.section) else { return }
        
        if cellType == .imageCell {
            self.goToSecond(indexPath: indexPath)
        }
    }
}

extension FirstViewController: ButtonsTableViewCellDelegate {
    func removeButtonAction() {
        guard let indexPath = self.buttonsCellIndexPath else { return }
        
        self.buttonsCellDeleted = true
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func pushButtonAction() {
        guard let indexPath = self.buttonsCellIndexPath else { return }
    
        self.goToSecond(indexPath: indexPath)
    }
}

extension FirstViewController {
    enum CellTypes: Int, CaseIterable {
        case imageCell
        case buttonCell
        
        var cellIdentifier: String {
            switch self {
            case .imageCell:
                return "ImageTableViewCellIdentifier"
            case .buttonCell:
                return "ButtonsTableViewCellIdentifier"
            }
        }
        
        var nib: UINib? {
            switch self {
            case .imageCell:
                return UINib(nibName: String(describing: ImageTableViewCell.self), bundle: nil)
            case .buttonCell:
                return UINib(nibName: String(describing: ButtonsTableViewCell.self), bundle: nil)
            }
        }
    }
}
