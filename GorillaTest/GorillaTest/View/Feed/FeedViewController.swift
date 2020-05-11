//
//  ViewController.swift
//  GorillaTest
//
//  Created by Eduardo Oliveros Acosta on 11/05/20.
//  Copyright © 2020 Eduardo Oliveros Acosta. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var data: [Post] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupPostsRequest()
        updateNavigationBar()
        registerCells()
    }
    
    func updateNavigationBar() {
        let logo = UIImage(named: "logo")
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
    
    func setupPostsRequest() {
        let completion: ([Post]) -> Void = { data in
            self.data = data
        }
        Services.getPosts(completion: completion)
    }
    
    func registerCells() {
        tableView.register(PostTableViewCell.nib(), forCellReuseIdentifier: CellIdentifiers.postCell)
        tableView.register(UserTableViewCell.nib(), forCellReuseIdentifier: CellIdentifiers.userCell)
        tableView.register(NewPostTableViewCell.nib(), forCellReuseIdentifier: CellIdentifiers.newPostCell)
    }
}

extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        if indexPath.row == 1, cell is NewPostTableViewCell {
            self.performSegue(withIdentifier: "NewPost", sender: cell)
        }
    }
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.userCell) as! UserTableViewCell
            cell.model = UserTableViewModel()
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.newPostCell) as! NewPostTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.postCell) as! PostTableViewCell
            let post = data[indexPath.row - 2]
            let model = PostTableViewModel(post: post)
            cell.model = model
            return cell
        }
    }
}
