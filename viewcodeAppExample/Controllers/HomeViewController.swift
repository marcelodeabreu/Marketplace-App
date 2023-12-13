//
//  HomeViewController.swift
//  viewcodeAppExample
//
//  Created by Marcelo de Abreu on 31/10/23.

/*
 
 Home View:
 
 1. Banner
 
 2. Displaying random skins currently available at the market divided in diffent categories, such as:
        ["newly listed", "popular", "special floats", "price drops", "with stickers"]
 
 3.
 
 */

// ------------------------------------ x ------------------------------------

import UIKit

class HomeViewController: UIViewController {
    
    let sectionTitles: [String] = ["newly listed", "popular", "special floats", "price drops", "with stickers"]

    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        configureNavBar()
        
        
        
        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 250))
        homeFeedTable.tableHeaderView = headerView
    }
    
    private func configureNavBar() {
        
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "text.justify"), style: .done, target: self, action: nil)
        ]
        
        navigationItem.rightBarButtonItems = [
        
            UIBarButtonItem(image: UIImage(systemName: "dollarsign"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "plus.app"), style: .done, target: self, action: nil)
            
        ]
        navigationController?.navigationBar.tintColor = .systemGray
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
    

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
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
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
        header.textLabel?.text = header.textLabel?.text?.lowercased()
    }


    //
    //      >>>>>> We won't use the function scrollViewDidScroll with navbar because we want the user to be able to see their current balance all the time.
    //
    //    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    //        let defaultOffSet = view.safeAreaInsets.top
    //        let offset = scrollView.contentOffset.y + defaultOffSet
    //        
    //        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    //    }
    //
    
    
}
