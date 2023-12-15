//
//  InventoryViewController.swift
//  viewcodeAppExample
//
//  Created by Marcelo de Abreu on 31/10/23.
//
//
//  It needs to show the user inventory throu steam API.
//  It should show the current price at the cheapest similar skin active auction.
//  It must have a refresh button.
//
//
//
//


import UIKit

class InventoryViewController: UIViewController {
    
    private let inventoryFeedTable: UITableView = {
           let table = UITableView(frame: .zero, style: .grouped)
           table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
           return table
       }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(inventoryFeedTable)

        configureNavBar()
        
        inventoryFeedTable.delegate = self
        inventoryFeedTable.dataSource = self
    }
    
    private func configureNavBar() {
        
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .done, target: self, action: nil)
        ]
        
        navigationItem.rightBarButtonItems = [
        
            UIBarButtonItem(image: UIImage(systemName: "dollarsign"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "plus.app"), style: .done, target: self, action: nil)
            
        ]
        navigationController?.navigationBar.tintColor = .systemGray
        
    }
    
    override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           inventoryFeedTable.frame = view.bounds
       }
}

extension InventoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    
    
}
