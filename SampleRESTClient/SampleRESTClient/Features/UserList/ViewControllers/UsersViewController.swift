//
//  UsersViewController.swift
//  SampleRESTClient
//
//  Created by Abdullah Bayraktar on 09/09/2017.
//  Copyright © 2017 AB. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {

    let usersTableViewCellReuseIdentifier = "UsersTableViewCell"
    
    //MARK: Enums
    
    enum Route: String {
        case posts
    }
    
    //MARK: IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Properties
    
    var viewModel: UsersViewModel!
    var router: UsersRouter!
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData()
        
        setupNavigationBar()
        setupTableView()
    }
    
    //MARK: Setup UI Components
    
    private func setupTableView() {
        
        tableView.tableFooterView = UIView()
        
        let cellNib = UINib(nibName: usersTableViewCellReuseIdentifier, bundle: nil)
        
        tableView.register(cellNib, forCellReuseIdentifier: usersTableViewCellReuseIdentifier)
        
        tableView.estimatedRowHeight = UsersViewModel.tableViewRowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    private func setupNavigationBar() {
        
        //TODO: Localize Title
        self.title = "Users"
    }
    
    //MARK: Data
    
    func fetchData() {
        
        viewModel.fetchUsers { [weak self](error) in
            
            if error == nil {
                
                self?.tableView.reloadData()
            }
        }
    }
}

//MARK: UITableViewDataSource

extension UsersViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UsersTableViewCell = viewModel.usersViewModels[indexPath.row]
            .dequeueCell(tableView: tableView, indexPath: indexPath) as! UsersTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.usersViewModels.count
    }
}

//MARK: UITableViewDelegate

extension UsersViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let userViewModel = viewModel.usersViewModels[indexPath.row]
        let user = userViewModel.modelForSelectedCell()
        
        if let user = user as? User {
            userTapped(withModel: user)
        }
    }
}

//MARK: Route

extension UsersViewController {
    
    fileprivate func userTapped(withModel model: User) {
        router.route(to: Route.posts.rawValue,
                     from: self,
                     parameters: model.id)
    }
}

