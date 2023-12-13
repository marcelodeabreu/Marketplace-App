//
//  UserViewController.swift
//  viewcodeAppExample
//
//  Created by Marcelo de Abreu on 31/10/23.
//

import UIKit

class UserViewController: UIViewController {

    private let userFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(userFeedTable)
        configureNavBar()

        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 250))
        userFeedTable.tableHeaderView = headerView
    }
    
    private func configureNavBar() {
        
        navigationItem.rightBarButtonItems = [
        
            UIBarButtonItem(image: UIImage(systemName: "dollarsign"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "plus.app"), style: .done, target: self, action: nil)
            
        ]
        navigationController?.navigationBar.tintColor = .systemGray
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        userFeedTable.frame = view.bounds
    }

    

}
