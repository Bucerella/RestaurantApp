//
//  RestaurantTableViewController.swift
//  RestaurantApp
//
//  Created by Buse ERKUŞ on 8.05.2019.
//  Copyright © 2019 Buse ERKUŞ. All rights reserved.
//

import UIKit


protocol ListActions: class{
    func didTapCell(_ viewController: UIViewController, viewModel: RestaurantListViewModel)
}


class RestaurantTableViewController: UITableViewController {
    var viewModels = [RestaurantListViewModel](){
    didSet {
        tableView.reloadData()
    }
    }
    weak var delegete: ListActions?
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath) as! RestaurantTableViewCell
        
        let vm = viewModels[indexPath.row]
        cell.configure(with: vm)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailsViewController = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") else { return }
        navigationController?.pushViewController(detailsViewController, animated: true)
        let vm = viewModels[indexPath.row]
        delegete?.didTapCell(detailsViewController, viewModel: vm)
    }
    
}
