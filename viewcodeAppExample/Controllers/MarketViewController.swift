//
//  MarketViewController.swift
//  viewcodeAppExample
//
//  Created by Marcelo de Abreu on 31/10/23.
//

import UIKit

class MarketViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavBar()
        
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
    
}
