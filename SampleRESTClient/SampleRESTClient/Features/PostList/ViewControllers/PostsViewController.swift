//
//  PostsViewController.swift
//  SampleRESTClient
//
//  Created by Abdullah Bayraktar on 10/09/2017.
//  Copyright © 2017 AB. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {
    
    let postsTableViewCellReuseIdentifier = "PostsTableViewCell"
    
    //MARK: IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Properties
    
    var viewModel: PostsViewModel!
    var router: PostsRouter!
    
    //MARK: Factory
    
    /**
     Creates a PostsViewController Instance.
     
     - Returns: an instance of the view controller.
     */
    class func getInstance() -> PostsViewController {
        
        let identifier = PostsViewController.className
        
        let viewController : PostsViewController = UIStoryboard.storyboard(storyboard: .posts, bundle: nil).instantiateViewController(withIdentifier: identifier) as! PostsViewController
        
        return viewController
    }
    
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
        
        let cellNib = UINib(nibName: postsTableViewCellReuseIdentifier, bundle: nil)
        
        tableView.register(cellNib, forCellReuseIdentifier: postsTableViewCellReuseIdentifier)
        
        tableView.estimatedRowHeight = PostsViewModel.tableViewRowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    private func setupNavigationBar() {
        
        //TODO: Localize Title
        self.title = "Posts"
    }
    
    //MARK: Data
    
    func fetchData() {
        
        viewModel.fetchPosts { [weak self](error) in
            
            if error == nil {
                
                self?.tableView.reloadData()
            }
        }
    }
}

//MARK: UITableViewDataSource

extension PostsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: PostsTableViewCell = viewModel.postsViewModels[indexPath.row]
            .dequeueCell(tableView: tableView, indexPath: indexPath) as! PostsTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.postsViewModels.count
    }
}
